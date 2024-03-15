import { LightningElement,api } from 'lwc';

export default class StChildLWCA extends LightningElement {
    @api childMessage='';
    constructor(){
        super();
       // console.log('I am Child Constructor');
    }
    connectedCallback(){
        //console.log('I am Child connectedCallback');
    }
    render(){
        //console.log('I am Child render');
    }
    renderedCallback(){
       // console.log('I am Child renderedCallback');
    }
    disconnectedCallback(){
       // console.log('I am Child disconnectedCallback');
    }
    errorCallback(){
        //console.log('I am Child errorCallback');
    }
}