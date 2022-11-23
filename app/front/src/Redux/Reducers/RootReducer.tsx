import {combineReducers} from "@reduxjs/toolkit";
import SigningReducer from "./SigningReducer";
import ThemeReducer from "./ThemeReducer";

export const RootReducer = combineReducers({
    signing: SigningReducer,
    theme: ThemeReducer
})