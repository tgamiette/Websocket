import 'dart:async';
import 'package:chatflutter/ListUserPage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'HomePage.dart';
import 'LoginApp.dart';

Future<void> main() async {
  GetStorage.init();
  var user = GetStorage().read('user');

  if (GetStorage().read('user') == null) {
    print('User is currently signed out!');
    // runApp(const ListSection());
    runApp(const LoginApp());
  } else {
    print('User is signed in!');
    runApp(const HomePage());
  }
  await Future.delayed(const Duration(seconds: 2));
  GetStorage().write('user', 'user');
  print('seconde');
}
