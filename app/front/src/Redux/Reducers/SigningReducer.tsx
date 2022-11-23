import "bootstrap/dist/css/bootstrap.css"

export const LOGIN = 'sign/login'
export const LOGOUT = 'sign/logout'

const initialState = {
    isLogged: false,
    token: null
}


export default function SigningReducer(state = initialState, action: {
    payload: any;
    type: any;
}) {

    switch (action.type) {
        case LOGIN:
            return {isLogged: true, token: action.payload}
        case LOGOUT:
            return {isLogged: false, token: null}
        default:
            return state;
    }


}

