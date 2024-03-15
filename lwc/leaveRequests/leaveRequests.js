import { LightningElement, track, wire, api } from 'lwc';
import getMyLeaveRequests from '@salesforce/apex/LeaveRequestController.getLeaveRequests';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import USERID from '@salesforce/user/Id';

const COLUMNS = [
    { label: 'Request Id', fieldName: 'Name', cellAttributes: { class: { fieldName: 'cellClass' } } },
    { label: 'User', fieldName: 'userName', cellAttributes: { class: { fieldName: 'cellClass' } } },
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
export default class LeaveRequests extends LightningElement {
    columns = COLUMNS;
    leaveRequests = [];
    leaveRequestsWireResult;
    objectApiName = 'LeaveRequest__c';
    recordId = '';
    currentUserId = USERID;
    showModelPopup = false;

    @wire(getMyLeaveRequests)
    wiredMyLeaves(result) {
        if (result.data) {
            this.leaveRequestsWireResult = result;
            this.leaveRequests = result.data.map(a => ({
                ...a,
                userName:a.User__r.Name,
                cellClass: a.Status__c == 'Pending' ? 'slds-theme_success' : a.Status__c == 'Rejected' ? 'slds-theme_warning' : '',
                isEditDisabled: a.Status__c != 'Pending'
            }));
        }
        if (result.error) {
            console.log('Error occured while fetching my leaves- ' + result.error);
        }
    }
    get noRecordsFound() {
        return this.leaveRequests.length == 0;
    }
    handleRowAction(event) {
        this.recordId = event.detail.row.Id;
        this.showModelPopup = true;
    }
    successHandler(event) {
        this.showModelPopup = false;
        this.showToast('Data saved successfully.', 'Success', 'success');
        this.refreshGrid();
    }
    popupCloseHandler() {
        this.showModelPopup = false;
    }
    @api refreshGrid() {
        refreshApex(this.leaveRequestsWireResult);
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