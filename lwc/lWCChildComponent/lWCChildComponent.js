import { LightningElement, api } from 'lwc';

export default class LWCChildComponent extends LightningElement {
    @api primaryValue;
    primaryMethodValue = '';
    secundaryValue = '';

    connectedCallback() {
        console.log('======> primaryValue ' + this.primaryValue);
    }
    @api primaryMethod(paramsvalue) {
        this.primaryMethodValue = paramsvalue;
    }
    handlesubmit() {
        this.secundaryValue = this.refs.secoundaryvalue.value;
        const customEvent = new CustomEvent('customevent', {
            detail: this.secundaryValue
        });
        this.dispatchEvent(customEvent);
    }
}