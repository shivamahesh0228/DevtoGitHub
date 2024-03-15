import { LightningElement,wire } from 'lwc';
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import { getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import CHILD_OBJECT from '@salesforce/schema/Child__c';
import FIELDAPINAME from '@salesforce/schema/Child__c.Picklist1__c';

export default class PicklistDependency extends LightningElement {
showdependent=false;
controllingPicklist=[];
finaleDependentVal=[];
dependentPicklist;
dependentDisabled=true;
showpicklist=false;

@wire(getObjectInfo, { objectApiName: CHILD_OBJECT })
    wiredData({data, error}){
       if(data){
         console.log('Object INFO:', data);
       }
       if(error){
         console.log('Some Error Occured');
       }
    }

    @wire(getPicklistValuesByRecordType, { recordTypeId: "0125g000002YyIcAAK", fieldApiName: FIELDAPINAME })
    getPicklistValues({data,error}){
        if(data){
            console.log('Data '+JSON.stringify(data));
        }
    }
connectedCallback(){
    
}
}