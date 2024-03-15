import { LightningElement, api } from 'lwc';
export default class ComponentB extends LightningElement {
    @api userName;
    userName1='';

    @api demoMthod(name) {
        alert('User Name is (Calling from Component A) : ' + name);
    }
    handlecompocEvent(event) {
        console.log('This Component B Parent');
        this.userName1 = event.detail;
    }
}