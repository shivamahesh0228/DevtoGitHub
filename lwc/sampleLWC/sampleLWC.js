import { LightningElement,api } from 'lwc';
import getAccountList from '@salesforce/apex/SampleAccountApexCls.getAccountList';
export default class SampleLWC extends LightningElement {
    @api accountList='This is Public Property';
    constructor() {
        super();
        getAccountList()
            .then(result => {
                //this.accountList = result;
                console.log('accountList ===> ' + JSON.stringify(this.accountList));
                console.log('Rsult ===> ' + JSON.stringify(result));
            }).catch(error => {
                console.log('error ===> ' + JSON.stringify(error));
            })
    }
}