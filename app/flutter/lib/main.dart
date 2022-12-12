import 'dart:async';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'HomePage.dart';
import 'LoginApp.dart';

Future<void> main() async {
  // GetStorage.init();
  // final LocalStorage storage = LocalStorage('user');
  // await storage.ready.then((value) {
  //   print(storage.getItem('jwt'));
    // if (storage.getItem('jwt') == null) {
      print('User is currently signed out!');
      runApp(const LoginApp());
    // } else {
    //   print('User is signed in!');
    //   runApp(const HomePage());
    // }
  // });
}
