import 'package:chatflutter/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            ],
          ),
        ),
      ),
    );
  }

  void _login() {}
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

