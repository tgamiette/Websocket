import React, {useContext, useState} from "react";
import {
    View,
    Text,
    TextInput,
    TouchableOpacity, StyleSheet,
} from "react-native";
import {authUserContext, AuthUserProvider} from "../Contexts/auth";
import {selectUser, setUser} from "../Redux/userSlice";
import {useSelector, useDispatch} from "react-redux";
import SafeAreaView from "react-native/Libraries/Components/SafeAreaView/SafeAreaView";
import useGetJWT from "../Hook/useGetJWT";
import List from "../Screens/list";
import jwt from 'jwt-decode';


const Login = ({navigation}) =>{
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    const [error, setError] = useState(false);
    const [logUser, setLogUser] = useContext(authUserContext);
    const getJWT = useGetJWT();
    const dispatch = useDispatch();


    const handleSubmit = (e) => {
        e.preventDefault();
        getJWT(username, password).then(data => {
            if (data.JWT) {
                const deparse = jwt(data.JWT);
                dispatch(setUser({
                    jwt: data.JWT,
                    username: deparse.mercure.payload.username,
                    id: deparse.mercure.payload.userid,
                }));
                navigation.navigate("List", {replace: true});
                console.log(data.JWT)
            } else {
                console.log(data)
            }
        })
    }

    return(
        <SafeAreaView style={styles.container}>
            <View  style={styles.login}>
                <View>
                    <Text>Username</Text>
                    <TextInput value={username} onChangeText={(username)=>setUsername(username)} placeHolder="username" style={styles.input}/>
                </View>
                <View style={styles.form}>
                    <Text>Password</Text>
                    <TextInput value={password} onChangeText={(password)=>setPassword(password)} placeHolder="password" style={styles.input} autoCapitalize='none' secureTextEntry={true}/>
                </View>
                <View>
                    <TouchableOpacity onPress={handleSubmit} style={styles.button}>
                        <Text style={styles.text}>Login</Text>
                    </TouchableOpacity>
                </View>
            </View>
        </SafeAreaView>
        )
}
const styles = StyleSheet.create({
    input: {
        backgroundColor: 'pink',
        width: '100%'
    },
    button: {
        marginTop: 10,
        backgroundColor: 'green',
        alignItems: 'center'
    },
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: 'red',
    },
    login: {
        flex: 0.5,
        backgroundColor: 'blue',
        width: '80%'
    }
    })
 export default Login;

