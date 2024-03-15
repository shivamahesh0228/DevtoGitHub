import { LightningElement, api, wire } from 'lwc';
import getMovieDetails from '@salesforce/apex/SalesforceIntegration_Ex_1.getIMDBMovieDetailsCallout';
export default class MovieDetails extends LightningElement {
    _movieId = '';
    movieDetails = null;
    isLoading = true;
    @api
    get movieId() {
        return this._movieId;
    }

    set movieId(value) {
        if (value) {
            this.isLoading = true;
        }
        this._movieId = value;
    }
    connectedCallback() {
        console.log('movieId ===> ' + this.movieId);
        getMovieDetails({ movieId: this.movieId })
            .then(result => {
                console.log('result ===>22 ' + JSON.stringify(result));
                this.movieDetails = JSON.parse(result).result;
                console.log('movieDetails ===> ' + JSON.stringify(this.movieDetails));
                this.isLoading = false;
            }).catch(error => {
                console.log('Error occured while searching movies -' + error);
                this.isLoading = false;
            })
    }
    // @wire(getMovieDetails, { movieId: '$movieId' })
    // wiredGetMovieDetails(result) {
    //     if (result.data) {
    //         this.movieDetails = JSON.parse(result.data).result;
    //         console.log('movieDetails ===> ' + JSON.stringify(this.movieDetails));
    //     }
    //     else if (result.error) {
    //         console.log('Error occured while searching movies -' + result.error);
    //     }
    //     this.isLoading = false;
    // }

    get showMovieContent() {
        return (!this.isLoading) && this.movieId;
    }
}