import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            const SizedBox(
              height: 40,
            ),
            inputSection2,
            signupButton2,
          ],
        ),
      ),
    );
  }
  void _register() {}
}



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