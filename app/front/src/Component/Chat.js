import React, {useEffect} from 'react';
import Message from "./Message";
import useGetChat from "../Hook/userGetChat";
import {useLocation} from "react-router-dom";
import FormMessage from "./FormMessage";

import '../assets/style/Chat.css';

export default function Chat() {

    const [chat, setChat] = React.useState("");
    const state = useLocation();

    const getChat = useGetChat(state.state.topic);
    const isTopic = state.state.isTopic;


    useEffect(() => {
        if (isTopic) {
            getChat().then(data => setChat(data));
        }
    }, [isTopic])

    console.log(chat);

    const currentUser = "Davion";


    return (

        <section>
            <a href={"/"}>Retour</a>
            <div className="container py-5">
                <div className="row d-flex justify-content-center">
                    <div className="col-md-10 col-lg-8 col-xl-6">

                        <div className="card" id="chat2">
                            <div className="card-header d-flex justify-content-between align-items-center p-3">
                                <h5 className="mb-0">Chat</h5>
                                <button type="button" className="btn btn-primary btn-sm">Let's Chat App</button>
                            </div>
                            <div className="card-body" data-mdb-perfect-scrollbar="true">
                                {
                                    isTopic ?
                                        <>
                                            {
                                                chat !== "" ?
                                                    chat.message.map((message, index) => {
                                                        return <Message key={index} message={message}/>
                                                    }) :
                                                    null
                                            }
                                        </>
                                        : <p>Envoyez un message pour démarrer la conversation</p>
                                }
                            </div>

                            <FormMessage currentUser={currentUser}/>

                        </div>

                    </div>
                </div>
            </div>
        </section>
    )
}