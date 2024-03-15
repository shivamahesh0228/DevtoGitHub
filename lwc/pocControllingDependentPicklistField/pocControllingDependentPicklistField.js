import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import OBJECT_APINAME from '@salesforce/schema/Account';
import STATEFIELD_APINAME from '@salesforce/schema/Account.State__c'
import CITYFIELD_APINAME from '@salesforce/schema/Account.City__c'

export default class PocControllingDependentPicklistField extends LightningElement {
    finalDependentCityVal = [];
    selectedValue = 'Hyderabad';
    isMultiple = false;
    // get Specific Object information
    @wire(getObjectInfo, { objectApiName: OBJECT_APINAME })
    objectInfo;

    // get Default Record type Id
    get defutlRecordTypeId() {
        return objectInfo.data.defaultRecordTypeId;
    }

    // get State Picklist values from getPicklistValues
    @wire(getPicklistValues, { recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: STATEFIELD_APINAME })
    getStatePicklistValues;

    // get City Picklist values from getPicklistValues
    @wire(getPicklistValues, { recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: CITYFIELD_APINAME })
    getCityPicklistValues;

    // after selected State populated city based on State
    handleStstaeChange(event) {
        this.finalDependentCityVal = [];
        const key = event.target.value;
        console.log('====> key  ' + key);
        console.log('====> getCityPicklistValues ' + JSON.stringify(this.getCityPicklistValues));
        let controllerValues = this.getCityPicklistValues.data.controllerValues;
        console.log('====> controllerValues ' + JSON.stringify(controllerValues));
        this.getCityPicklistValues.data.values.forEach(depVal => {
            depVal.validFor.forEach(depKey => {
                if (depKey === controllerValues[key]) {
                    this.finalDependentCityVal.push({ label: depVal.label, value: depVal.value });
                }
            });
        });
        this.isMultiple = true;
        console.log('====> finalDependentCityVal ' + JSON.stringify(this.finalDependentCityVal));
    }
}