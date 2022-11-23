import {FilmInterface} from "../../Interface/FilmInterfaces";

import * as SigningReducer from '../Reducers/SigningReducer';


export function addFilm(film: FilmInterface) {
    return {
        type: '',

    }

}

export function logout() {
    return {
        type: SigningReducer.LOGOUT,
    }

}

export function logged(token: string) {
    return {
        type: SigningReducer.LOGIN,
        payload: token
    }

}
