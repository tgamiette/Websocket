import React, {useContext, useState} from "react";
import {
    View,
    Text,
    Image,
    TextInput,
    TouchableOpacity, StyleSheet,
} from "react-native";
import {authUserContext, AuthUserProvider} from "../Contexts/auth";
import SafeAreaView from "react-native/Libraries/Components/SafeAreaView/SafeAreaView";
import useGetJWT from "../Hook/useGetJWT";
import List from "../Screens/list";

const Login = ({navigation}) =>{
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    const [error, setError] = useState(false);
    const [logUser, setLogUser] = useContext(authUserContext);
    const getJWT = useGetJWT()

    const handleSubmit = (e) => {
        e.preventDefault();
        getJWT(username, password).then(data => {
            if (data.JWT) {
                setLogUser(data.JWT);
                navigation.navigate(from, {replace: true});
            } else {
                console.log(data)
            }
        })
    }

    return(
        <SafeAreaView style={styles.container}>
            <View  style={styles.login}>
                <Image/>
                <View>
                    <Text style={styles.title}>TITRE</Text>
                </View>
                <View>
                    <Text>Username</Text>
                    <TextInput value={username} onChangeText={(username)=>setUsername(username)} placeHolder="username" style={styles.input}/>
                </View>
                <View>
                    <Text>Password</Text>
                    <TextInput value={password} onChangeText={(password)=>setPassword(password)} placeHolder="password" style={styles.input}/>
                </View>
                <View>
                    <TouchableOpacity onPress={handleSubmit} style={styles.button}>
                        <Text>Se connecter</Text>
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
    },
    title: {
        alignItems: 'center',
        width: '100%'
    }
    })
 export default Login;

