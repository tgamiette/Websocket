import React, {useState, useEffect} from "react";
import {useCreateNewTopic} from "../Hook/useCreateNewTopic";

export default function FormMessage(currentUser) {
    const [content, setContent] = useState("");
    const newMessage = useCreateNewTopic("Davion", content);

    const handleSubmit = (e) => {
        e.preventDefault();
        setContent(e.target.message.value);
    }

    useEffect(() => {
        if (content !== "") {
            newMessage().then(data => console.log(data));
        }
    }, [content])

    return (
        <div className="card-footer text-muted d-flex justify-content-start align-items-center p-3">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3-bg.webp"
                 alt="avatar 3"/>
            <form className="me-3" onSubmit={handleSubmit}>
                <input type="text" name="message" className="form-control form-control-lg"
                       id="exampleFormControlInput1"
                       placeholder="Type message"/>
                <button type="submit" className="btn btn-primary btn-sm">Envoyer</button>
            </form>
            <a className="ms-1 text-muted" href="#!"><i
                className="fas fa-paperclip"></i></a>
            <a className="ms-3 text-muted" href="#!"><i className="fas fa-smile"></i></a>
            <a className="ms-3" href="#!"><i className="fas fa-paper-plane"></i></a>
        </div>
    )
}