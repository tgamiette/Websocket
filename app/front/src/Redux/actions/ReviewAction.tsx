import {ReviewInterface} from "../../Interface/FilmInterfaces";
import {FilmInterface} from "../../Interface/FilmInterfaces";
import * as ReviewReducer from '../Reducers/ReviewReducer';

export function addReview(review: any) {
    return {
        type: ReviewReducer.ADD,
        payload: review
    }
}

export function DeleteReview(review: ReviewInterface) {
    return {
        type: ReviewReducer.ADD,
        payload: review
    }
}

function getReview(reviews: ReviewInterface[]) {
    return {
        type: ReviewReducer.REMPLACE,
        payload: reviews
    }

}
