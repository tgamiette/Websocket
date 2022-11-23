import {FilmInterface, ReviewInterface} from "../../Interface/FilmInterfaces";
import * as ThemeReducer from '../Reducers/ThemeReducer';
import {SetStateAction} from "react";

export function changeTheme() {
    return {
        type: ThemeReducer.CHANGE,
        payload: ""
    }
}

