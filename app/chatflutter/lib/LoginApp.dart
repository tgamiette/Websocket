import 'package:chatflutter/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        alignment: Alignment.center,
        // we can set width here with conditions
        width: 200,
        height: kToolbarHeight,
        child: const Text("MY AppBar"),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(200, kToolbarHeight);
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logoIcon,
              titleSection,
              inputSection,
              const ButtonWidget(),
              bottomSection,
            ],
          ),
        ),
      ),
    );
  }

  void _login() {}
}

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  // const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            topSection2,
            inputSection2,
            signupButton2,
          ],
        ),
      ),
    );
  }
  void _register() {}
}

Widget logoIcon = Container(
  width: 250,
  height: 250,
  margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
  padding: const EdgeInsets.all(30),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(70),
    color: const Color.fromRGBO(255, 255, 255, 0.1),
  ),
  child: Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 20,
            offset: const Offset(0, 3),
          ),
        ]),
    child: Image.asset(AssetsRes.IMG),
  ),
);

Widget titleSection = Container(
  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GradientText(
        'WhatsApp',
        gradient: const LinearGradient(
          colors: [
            Colors.black,
            Colors.black87,
            Colors.lightGreen,
            Colors.green
          ],
        ),
        style: GoogleFonts.lobster(fontSize: 40, fontWeight: FontWeight.w900),
      ),
    ],
  ),
);

Widget inputSection = Container(
  // color: Colors.green,
  margin: const EdgeInsets.all(30),
  child: Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.01),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 1, color: Colors.white30),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Icon(
                Icons.people_outline,
                size: 30,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(
              width: 260,
              height: 60,
              child: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(3),
                      border: InputBorder.none,
                      hintText: 'Pseudo',
                      hintStyle: GoogleFonts.comfortaa(
                        // fontSize: 20,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.01),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 1, color: Colors.white30),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Icon(
                Icons.lock_outline,
                size: 30,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(
              width: 260,
              height: 60,
              child: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  style: GoogleFonts.comfortaa(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(3),
                    border: InputBorder.none,
                    hintText: 'Mot de passe',
                    hintStyle: GoogleFonts.comfortaa(
                      // fontSize: 20,
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(110, 15, 110, 15),
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))),
        onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupPage(),
                ),
              ),
            },
        child: Text(
          'Connexion'.toUpperCase(),
          style: GoogleFonts.anaheim(
            fontSize: 20,
            color: Colors.blue[900],
          ),
        ));
  }
}

Widget bottomSection = Container(
  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
  // color: Colors.green,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Pas encore inscrit ?',
        style: GoogleFonts.comfortaa(color: Colors.white),
      ),
      const SignupButton()
    ],
  ),
);

class SignupButton extends StatelessWidget {
  const SignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupPage(),
                ),
              ),
            },
        child: Text(
          'Inscrivez vous',
          style: GoogleFonts.comfortaa(
              color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

Widget topSection2 = Container(
    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
    // color: Colors.red,
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'Déjà un compte ?',
        style: GoogleFonts.comfortaa(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
      const BackButtonCustom(),
    ])
  // child: Text("toto"),
);

Widget inputSection2 = Container(
  padding: const EdgeInsets.all(20),
  // color: Colors.blue,
  margin: const EdgeInsets.all(30),
  child: Column(
    children: [
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white30, width: 1),
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromRGBO(255, 255, 255, 0.1),
        ),
        height: 60,
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Icon(
                Icons.people_outline,
                size: 30,
                color: Colors.blue[900],
              ),
            ),
            Expanded(
              child: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintText: 'Pseudo',
                    hintStyle: GoogleFonts.comfortaa(color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white30, width: 1),
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromRGBO(255, 255, 255, 0.1),
        ),
        height: 60,
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Icon(
                Icons.email_outlined,
                size: 30,
                color: Colors.blue[900],
              ),
            ),
            Expanded(
              child: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: GoogleFonts.comfortaa(color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 1, color: Colors.white30),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Icon(
                Icons.lock_outline,
                size: 30,
                color: Colors.blue[900],
              ),
            ),
            Expanded(
              child: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  style: GoogleFonts.comfortaa(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Mot de passe',
                      hintStyle: GoogleFonts.comfortaa(
                        // fontSize: 20,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 1, color: Colors.white30),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Icon(
                Icons.date_range_sharp,
                size: 30,
                color: Colors.blue[900],
              ),
            ),
            Expanded(
              child: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  style: GoogleFonts.comfortaa(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Date de naissance',
                      hintStyle: GoogleFonts.comfortaa(
                        // fontSize: 20,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget signupButton2 = ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    padding: const EdgeInsets.fromLTRB(110, 15, 110, 15),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  ),
  child: Text(
    "Inscription".toUpperCase(),
    style: TextStyle(
      color: Colors.blue[900],
      fontSize: 20.0,
    ),
  ),
  onPressed: () {},
);

class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        'Connexion',
        style: GoogleFonts.comfortaa(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
