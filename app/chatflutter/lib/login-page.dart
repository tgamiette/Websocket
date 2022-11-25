import 'package:chatflutter/res/assets_res.dart';
import 'package:flutter/material.dart';

import 'LoginApp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsRes.CROP),
          fit: BoxFit.cover,
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              // shadowColor: Colors.redAccent,
              elevation: 0,
              backgroundColor: Colors.transparent,
              flexibleSpace: const SafeArea(
                child: TabBar(
                  // isScrollable: true,
                  tabs: [Tab(text: 'Connexion'), Tab(text: 'Inscription')],
                ),
              ),
            ),
            body: const TabBarView(
              children: [
                LoginPage(),
                SignupPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
