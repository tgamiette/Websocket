import {useEffect, useState} from "react";
import useGetUserList from "../Hook/useGetUserList";
import {useGetNewChat} from "../Hook/useGetNewChat";
import {useNavigate} from "react-router-dom"


export default function UserList() {
    const [userList, setUserList] = useState([]);
    const navigate = useNavigate();
    const [topic, setTopic] = useState("");
    const [recipient, setRecipient] = useState("");
    const newChat = useGetNewChat(recipient);
    const getUserList = useGetUserList();


    const handleNewChat = (id) => {
        const userId = id;
        setRecipient(id);
    }

    useEffect(() => {
        newChat().then(data => setTopic(data));
    }, [recipient]);

    useEffect(() => {
        if (topic !== "") {
            navigate(`/chat/${topic.id}`, {
                state: {
                    topic: topic.id,
                    isTopic: topic.message.length > 0 ? true : false
                }
            });
        }
    }, [topic])

    const handleMessage = (e) => {
        document.querySelector('h1').insertAdjacentHTML('afterend', '<div class="alert alert-success w-75 mx-auto">Ping !</div>');
        window.setTimeout(() => {
            const $alert = document.querySelector('.alert');
            $alert.parentNode.removeChild($alert);
        }, 2000);
        console.log(JSON.parse(e.data));
    }

    useEffect(() => {
        getUserList().then(data => setUserList(data.users));


        const url = new URL('http://localhost:9090/.well-known/mercure');
        url.searchParams.append('topic', 'https://example.com/my-private-topic');

        console.log(url.toString());

        const eventSource = new EventSource(url, {withCredentials: true});
        eventSource.onmessage = handleMessage;

        return () => {
            eventSource.close()
        }

    }, [])

    return (
        <div>
            <h1 className='m-5 text-center'>What's app</h1>
            {userList.map((user) => (
                <>
                    <span>{user.username}</span>
                    <button className='btn btn-dark w-100' type='submit' value={user.id}
                            onClick={() => handleNewChat(user.id)}>Nouvelle conversation
                    </button>
                    <a href="/chat">chat</a>
                </>

            ))}
        </div>
    )
}