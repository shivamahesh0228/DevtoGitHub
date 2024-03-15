import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import RATING_FIELD from "@salesforce/schema/Account.Rating";

export default class PicklistLWC extends LightningElement {
    ratings = [];

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    objectInfo;

    @wire(getPicklistValues, { recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: RATING_FIELD })
    picklistResults

   
}