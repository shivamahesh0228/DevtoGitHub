import { LightningElement, track, api } from 'lwc';
export default class ChildComponent extends LightningElement {
    @api childMessage;
    count = 0;
    constructor() {
        super();
        console.log('This is Child constructor');
    }
    connectedCallback() {
        console.log('This is Child connectedCallback');
        console.log('Parent Message ' + this.childMessage);
    }
    renderedCallback() {
        console.log('This is Child renderedCallback');
    }
    disconnectedCallback() {
        console.log('This is Child disconnectedCallback');
    }
    errorCallback(error, stack) {
        this.error = error;
        console.log('Child error ' + this.error);
    }
    // render() {
    //     console.log('This is Child render');
    // }
    handleChildClick() {
        console.log('Custom Event');
        this.childMessage = 'Child Message';
        const customEvent = new CustomEvent('parenthandleclick', {
            detail:
            {
                message: this.childMessage,
                count: (++this.count)
            }
        });
        this.dispatchEvent(customEvent);
    }
}