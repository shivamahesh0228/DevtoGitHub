import { LightningElement, api } from 'lwc';

export default class LWCComponentsCommunications extends LightningElement {
    primaryValue = '';
    secundaryValue = '';
    handlesubmit(event) {
        this.primaryValue = this.refs.primaryvalue.value;
        this.refs.childComp.primaryMethod(this.primaryValue);
        console.log('=======> primaryValue ' + this.primaryValue);
    }
    handleParentEvent(event) {
        this.secundaryValue = event.detail;
        console.log('=============>event  ' + this.secundaryValue);
    }
}