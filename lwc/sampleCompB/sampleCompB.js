import { LightningElement,api } from 'lwc';
export default class SampleCompB extends LightningElement {
    @api compBMessage;
    sampleBMessage='';

    @api compBMethod(sampleMessage){
     this.sampleBMessage=sampleMessage;
    }
}