import { LightningElement } from 'lwc';

export default class SampleCompA extends LightningElement {
    sampleMessageA='';
    isvisiblecompB=false;
    constructor(){
        super();
    }
    connectedCallback(){
        
    }
    handleclick(event){
        this.sampleMessageA=event.target.value;
        this.isvisiblecompB=true; 
    }
    handleaclick(event){
        console.log('Hello');
        let sampleMessage='Sample Meesage';
        this.refs.CompB.compBMethod(sampleMessage);
        this.isvisiblecompB=true; 
    }
}