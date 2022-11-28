import base64 from "react-native-base64";

export default function useGetJWT() {

    return function (username, password) {
        const credentials = base64.encode(`${username}:${password}`);
        console.log(credentials);
        return fetch('http://localhost:8245/login', {
            method: 'GET',
            body: JSON.stringify(credentials),
            headers: {
                'Content-Type': 'application/json',
            }
        })
            .then(data => data.json())
    }
}
