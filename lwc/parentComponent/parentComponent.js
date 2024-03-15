import { LightningElement, track, api, wire } from 'lwc';
import USERID from '@salesforce/user/Id';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
export default class ParentComponent extends LightningElement {
    parenMessage = 'Parent Message';
    userId;
    count = 0;
    
    constructor() {
        super();
        console.log('This is Parent constructor');
    }
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    getAccountRecord(data, error) {
        if (data) {
            this.accountList = data;
            console.log('Account data ' + JSON.stringify(this.accountList));
        } else if (error) {
            console.log('Error ' + error);
        }
    }
    connectedCallback() {
        console.log('This is Parent connectedCallback');
        this.userId = USERID;
        console.log('User Id ' + USERID);
        //console.log('account  Id ' + ACCOUNTAPI);
        //this.account_API = JSON.stringify(ACCOUNTAPI);
    }
    renderedCallback() {
        console.log('This is Parent renderedCallback');
        console.log('This is Parent renderedCallback Count ' + this.count);
    }
    disconnectedCallback() {
        console.log('This is Parent disconnectedCallback');
    }
    errorCallback(error, stack) {
        this.error = error;
        console.log('Parent error  ' + this.error);
    }
    // render(){
    //     console.log('This is Child render');
    // }
    handleParentClick(event) {
        this.parenMessage = event.detail.message;
        this.count = event.detail.count;
        //console.log('parenMessage ' + this.parenMessage);
    }
}