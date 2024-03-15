import { LightningElement, track } from 'lwc';
export default class Lightningprogressindicator extends LightningElement {
    @track selectedStep = 'account';

    nextStep() {
        var moveToNextStep = this.selectedStep;
        if (this.selectedStep == 'contact') {
            //alert('Next step is opportunity');
            this.selectedStep = 'opportunity';
        }
        else if (this.selectedStep == 'account') {
            //alert('Next step is contact');
            this.selectedStep = 'contact';
        }
    }
    previousStep() {
        var moveToPreviousStep = this.selectedStep;
        if (this.selectedStep == 'contact') {
            //alert('Previous step is account');
            this.selectedStep = 'account';
        }
        else if (this.selectedStep == 'opportunity') {
            //alert('Previous step is contact');
            this.selectedStep = 'contact';
        }
    }
    selectStepAccount() {
        //alert('Selected step is account');
        this.selectedStep = 'account';
    }

    selectStepContact() {
        //alert('Selected step is contact');
        this.selectedStep = 'contact';
    }
    selectStepOpportunity() {
        //alert('Selected step is opportunity');
        this.selectedStep = 'opportunity';
    }
}