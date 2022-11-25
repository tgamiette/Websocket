import {useState, useContext} from "react";
import {userContext} from "../Context/UserContext";

export default function useGetUserList() {

    const user = useContext(userContext);
    
    return function () {

        return fetch('http://localhost:8245/api/user/list', {
            method: 'GET',
            mode: "cors",
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${user[0]}`
            }
        })
            .then(data => data.json())
    }
}