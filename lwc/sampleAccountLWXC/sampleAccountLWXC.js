import { LightningElement, wire, track } from 'lwc';
import getAccountDetails from '@salesforce/apex/SampleAccountController.getAccountList'
export default class SampleAccountLWXC extends LightningElement {
    accountList = [];
    accountImperativlyList = [];
    error;

    // Wire method call Apex method but in this method cacheble=true is mandatory
    @wire(getAccountDetails)
    getaccounts({ error, data }) {
        if (data) {
            this.accountList = data;
            this.error = undefined;
            console.log('====> Data ' + JSON.stringify(data));
        } else if (error) {
            this.error = JSON.stringify(error);
            this.accountList = undefined;
            console.log('====> error ' + JSON.stringify(error));
        }
    }
    constructor() {
        super();
        console.log('Inside Constructor ' + this.accountList.length);
    }
    connectedCallback() {
        // Imperatively call Apex method but in this method cacheble=true is not mandatory
        getAccountDetails({})
            .then(result => {
                this.accountImperativlyList = result;
                console.log('Inside connectedCallBack ' + this.accountImperativlyList.length);
            }).catch(error => {
                console.log('====> error ' + JSON.stringify(error));
            })
    }
    renderedCallback() {
        console.log('Inside renderedCallback ' + this.accountList.length);
    }
    disconnectedCallback() {
        //code
    }
    errorCallback(error, stack) {
        this.error = error;
    }
}