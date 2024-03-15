import { LightningElement } from 'lwc';
export default class ComponentC extends LightningElement {
    userName = '';

    handleClick(event) {
        this.userName = this.refs.userName.value;
        console.log('userName C ' + this.userName);
        const customEvent = new CustomEvent('componentcevent', {
            detail: this.userName,
            bubbles: true,
            composed: true
        });
        this.dispatchEvent(customEvent);
    }
}