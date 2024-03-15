import { LightningElement, api, track, wire } from 'lwc';
import OBJECT_APINAME from '@salesforce/schema/Account'
import NAME from '@salesforce/schema/Account.Name'
import RATING from '@salesforce/schema/Account.Rating'

export default class LightningDataService extends LightningElement {
    fields = [NAME, RATING];
    name = NAME;
    rating = RATING;
    recordId = '0015g00001dru7QAAQ';
    objectApiName = OBJECT_APINAME;
}