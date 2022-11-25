import 'bootstrap/dist/css/bootstrap.min.css';
import {BrowserRouter, Routes, Route} from "react-router-dom";
import NeedAuth from "./Auth/NeedAuth";
import UserList from "./Component/UserList";
import Login from "./Auth/Login";
import UserProvider from "./Context/UserContext";
import QrCode from "./Component/QrCode";

function App() {
    return (
        <UserProvider>
            <BrowserRouter>
                <Routes>
                    <Route path='/' element={
                        <NeedAuth>
                            <QrCode/>
                        </NeedAuth>
                    }/>
                    <Route path='/login' element={<Login/>}/>
                </Routes>
            </BrowserRouter>
        </UserProvider>
    );
}

export default App;
