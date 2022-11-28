import React from "react";
import {createNativeStackNavigator} from "@react-navigation/native-stack";
import {NavigationContainer} from "@react-navigation/native";
<<<<<<< HEAD
import Login from "../Screens/login";
=======
import Login from "../Auth/login";
>>>>>>> d90da6d0 (start react native project)
import List from "../Screens/list";


const Stack = createNativeStackNavigator();

export default function Route() {
    return (
            <NavigationContainer>
                <Stack.Navigator>
                    <Stack.Screen name="Login" component={Login}/>
                    <Stack.Screen name="List" component={List}/>
                </Stack.Navigator>
            </NavigationContainer>
    );
}
