import 'package:WhatsApp/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SignupPage.dart';
import 'login-page.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
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
          length: 2,
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
            body:  const TabBarView(
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









