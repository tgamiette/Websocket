import React from "react";
import {View, Text, Image} from "react-native";
import {SafeAreaView} from "react-native";
import UserList from "../Components/UserList";

const List = () => {
    return (
        <SafeAreaView>
            <View>
                <Text>toto</Text>
                <UserList />
            </View>
        </SafeAreaView>
    )
}

export default List;
