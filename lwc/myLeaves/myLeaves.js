import { LightningElement, track, wire, api } from 'lwc';
import getMyLeaves from '@salesforce/apex/LeaveRequestController.getMyLeaves';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import USERID from '@salesforce/user/Id';
const COLUMNS = [
    { label: 'Request Id', fieldName: 'Name', cellAttributes: { class: { fieldName: 'cellClass' } } },
    { label: 'From Date', fieldName: 'From_Date__c', cellAttributes: { class: { fieldName: 'cellClass' } } },
    { label: 'To Date', fieldName: 'To_Date__c', cellAttributes: { class: { fieldName: 'cellClass' } } },
    { label: 'Reason', fieldName: 'Reason__c', cellAttributes: { class: { fieldName: 'cellClass' } } },
    { label: 'Status', fieldName: 'Status__c', cellAttributes: { class: { fieldName: 'cellClass' } } },
    { label: 'Manager Comment', fieldName: 'Manager_Comment__c', cellAttributes: { class: { fieldName: 'cellClass' } } },
    {
        type: "button", typeAttributes: {
            label: 'Edit',
            name: 'Edit',
            title: 'Edit',
            value: 'edit',
            disabled: { fieldName: 'isEditDisabled' }
        }, cellAttributes: { class: { fieldName: 'cellClass' } }
    }
];
export default class MyLeaves extends LightningElement {
    columns = COLUMNS;
    myLeaves = [];
    myLeavesWiredResult;
    showModelPopup = false;
    recordId = '';
    currentUserId = USERID;
    objectApiName = 'LeaveRequest__c';

    @wire(getMyLeaves)
    wiredMyLeaves(result) {
        if (result.data) {
            this.myLeavesWiredResult = result;
            this.myLeaves = result.data.map(a => ({
                ...a,
                cellClass: a.Status__c == 'Pending' ? 'slds-theme_success' : a.Status__c == 'Rejected' ? 'slds-theme_warning' : '',
                isEditDisabled: a.Status__c != 'Pending'
            }));
        }
        if (result.error) {
            console.log('Error occured while fetching my leaves- ' + result.error);
        }
    }
    get noRecordsFound() {
        return this.myLeaves.length == 0;
    }
    newRequestClickHandler() {
        this.recordId = '';
        this.showModelPopup = true;
    }
    handleRowAction(event) {
        this.recordId = event.detail.row.Id;
        this.showModelPopup = true;
    }
    popupCloseHandler() {
        this.showModelPopup = false;
    }
    submitHandler(event) {
        event.preventDefault();
        const fields = { ...event.detail.fields };
        fields.Status__c = 'Pending';
        if (new Date(fields.From_Date__c) > new Date(fields.To_Date__c)) {
            this.showToast('From Date should not be grater than to date', 'Error', 'error');
        } else if (new Date() > new Date(fields.From_Date__c)) {
            this.showToast('From Date should not be less than to Today', 'Error', 'error');
        } else {
            this.refs.leaveRequestForm.submit(fields);
        }
    }
    successHandler(event) {
        this.showModelPopup = false;
        this.showToast('Data saved successfully.', 'Success', 'success');
        refreshApex(this.myLeavesWiredResult);
        const refreshEvent = new CustomEvent('refreshleaverequests');
        this.dispatchEvent(refreshEvent);
    }
    showToast(message, title = 'success', variant = 'success') {
        const event = new ShowToastEvent({
            title,
            message,
            variant
        });
        this.dispatchEvent(event);
    }
}