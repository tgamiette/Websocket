import {useContext} from "react";
import {userContext} from "../Context/UserContext";
import qs from 'qs';

export function useCreateNewTopic(recipient, content) {
    const user = useContext(userContext);

    return function () {

        var data = new FormData();
        data.append('content', content);
        data.append('recipient', recipient);

        return fetch(`http://localhost:8245/api/chat/send-message`, {
            method: 'POST',
            mode: "cors",
            data: data,
            headers: {
                'Content-Type': 'application/form-data',
                'Authorization': `Bearer ${user[0]}`
            }
        })
            .then(data => data.json())
    }
}