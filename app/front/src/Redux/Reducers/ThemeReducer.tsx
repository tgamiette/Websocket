import "bootstrap/dist/css/bootstrap.css"

export const CHANGE = 'theme/change'
const initialState = "light"
export default function ThemeReducer(state = initialState, action: {
    payload: boolean;
    type: any;
}) {

    switch (action.type) {
        case CHANGE:
            return state == "light" ? "dark" : "light"
        default:
            return state;
    }
}