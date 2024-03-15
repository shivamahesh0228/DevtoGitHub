import { LightningElement } from 'lwc';
export default class ComponentA extends LightningElement {
    parentUserName;
    userName = '';
    userName1 = '';
    handleClick() {
        this.parentUserName = this.refs.userName.value;
        this.refs.compB.userName = this.parentUserName;
        this.refs.compB.demoMthod(this.parentUserName);
    }
    handlecompocEvent(event) {
        console.log('This Component A Grand Parent ' + event.detail);
        this.userName1 = event.detail;
    }
}