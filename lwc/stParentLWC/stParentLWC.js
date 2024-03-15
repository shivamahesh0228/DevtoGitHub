import { LightningElement,track } from 'lwc';

export default class StParentLWC extends LightningElement {
    parentMessage='Temp 1';
    // Constructor
    constructor(){ 
        super();
        //console.log('I am Parent constructor');
    }
    connectedCallback(){
        //console.log('I am Parent connectedCallback ');
    }   
    renderedCallback(){
        //console.log('I am Parent renderedCallback');
    }
    disconnectedCallback(){
        //console.log('I am Parent disconnectedCallback');
    }
    errorCallback(error,stack){
        //console.log('errorCallback '+error);
    }
   //// render(){
    //console.log('parentMessage '+this.parentMessage);
   // }
    onchange(){
        if(this.parentMessage==='Temp 1'){
          this.parentMessage='Temp 2';
        }
        //this.parentMessage='I rendered Parent Component';
    }

}