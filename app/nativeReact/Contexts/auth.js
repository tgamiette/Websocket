import React from "react";
import {createContext, useState} from "react";


export const authUserContext = createContext('');

export default function AuthUserProvider(props) {
    const [authUser, setAuthUser] = useState('');

    return (
        <authUserContext.Provider value={[authUser, setAuthUser]}>
            {props.children}
        </authUserContext.Provider>
    );
}
// const AuthContext = createContext('');
//
// const AuthProvider = ( props ) => {
//     const [user, setUser] = useState('');
//
//     return (
//         <AuthContext.Provider value={[user, setUser()]}>
//             {props.children}
//         </AuthContext.Provider>
//         );
// };
//
// export { AuthContext, AuthProvider };
