import {RootReducer} from "./Reducers/RootReducer";
import {configureStore} from '@reduxjs/toolkit';

export const store = configureStore({
  reducer: {
    RootReducer,
  },
});
