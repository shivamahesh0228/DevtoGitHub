import { LightningElement, wire } from 'lwc';
import getMovies from '@salesforce/apex/SalesforceIntegration_Ex_1.getIMDBMovieCallout';
export default class MoviesList extends LightningElement {
    movies = [];
    searchText = '';
    selectedMovieId = '';
    isLoading = true;
    isvisibleMovieDetils = false;

    connectedCallback() {
        this.isLoading = false;
    }
    // @wire(getMovies, { searchText: '$searchText' })
    // wiredGetMovies(result) {
    //     if (result.data) {
    //         let data = JSON.parse(result.data);
    //         this.movies = data.success ? data.result : [];
    //     } else if (result.error) {
    //         console.log('Error occured while searching movies -' + result.error);
    //     }
    //     this.selectedMovieId = '';
    //     this.isLoading = false;
    // }
    searchClickHandler(event) {
        this.isLoading = true;
        this.searchText = this.refs.searchInput?.value;
        console.log('searchText: ' + this.searchText);
        getMovies({ searchText: this.searchText })
            .then(result => {
                console.log('result 30 ' + JSON.stringify(result));
                let data = JSON.parse(result);
                this.movies = data.success ? data.result : [];
                this.isLoading = false;
            }).catch(error => {
                this.isLoading = false;
                console.log('Error occured while searching movies -' + error);
            })
        this.selectedMovieId = '';
    }
    get showEnterSearchText() {
        return !this.searchText && this.movies == 0;
    }

    get noMoviesFound() {
        return this.searchText && this.movies == 0 && !this.isLoading;
    }
    viewDetailsClickHandler(event) {
        this.isvisibleMovieDetils = true;
        let movieId = event.target.dataset.movieId;
        this.selectedMovieId = movieId;
        window.scrollTo(0, 0);
    }
}