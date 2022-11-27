import 'package:WhatsApp/res/assets_res.dart';
import 'package:chatflutter/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String errormsg;
  late bool error, showprogress;
  late String username, password;

  final _username = TextEditingController();
  final _password = TextEditingController();

  startLogin(BuildContext context) async {
    String apiurl = "http://localhost:8245/login"; //api url
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP
username = _username.text;
    password = _password.text;
    var auth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    var response = await post(Uri.parse(apiurl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': auth
    });
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);

      var jsondata = jsonDecode(response.body);
          setState(() {
            error = false;
            showprogress = false;
          });
          //save the data returned from server
          //and navigate to home page
          // String uid = jsondata["uid"];
          // String fullname = jsondata["fullname"];
          // String address = jsondata["address"];
          // String jwt = jsondata["JWT"];
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomePage()) );
          //user shared preference to save data
        }else {
      print('pas connecter ?');

      setState(() {
        showprogress = false; //don't show progress indicator
        error = true;
        errormsg = "Error during connecting to server.";
      });
    }
  }

  @override
  void initState() {
    username = "";
    password = "";
    errormsg = "";
    error = false;
    showprogress = false;

    //_username.text = "defaulttext";
    //_password.text = "defaultpassword";
    super.initState();
  }

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
              Container(
                //show error message here
                padding: EdgeInsets.all(10),
                child:error? errmsg(errormsg):Container(),
                //if error == true then show error message
                //else set empty container as child
              ),
              Container(
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
                                controller: _username,
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
                                controller: _password,
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
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(110, 15, 110, 15),
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                  onPressed: () {
                    setState(() {
                      showprogress = true;
                      error = false;
                    });
                    startLogin(context);
                  },
                  child: showprogress
                      ? SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.orange[100],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.deepOrangeAccent),
                          ),
                        )
                      : Text(
                          'Connexion'.toUpperCase(),
                          style: GoogleFonts.anaheim(
                            fontSize: 20,
                            color: Colors.blue[900],
                          ),
                        ))
            ],
          ),
        ),
      ),
    );
  }
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

InputDecoration myInputDecoration(
    {required String label, required IconData icon}) {
  return InputDecoration(
    hintText: label,
    //show label as placeholder
    hintStyle: TextStyle(color: Colors.orange, fontSize: 20),
    //hint text style
    prefixIcon: Padding(
        padding: EdgeInsets.only(left: 20, right: 10),
        child: Icon(
          icon,
          color: Colors.orange,
        )
        //padding and icon for prefix
        ),

    contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.orange, width: 1)),
    //default border of input

    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.orange, width: 1)),
    //focus border

    fillColor: Color.fromRGBO(251, 140, 0, 0.5),
    filled: true, //set true if you want to show input background
  );
}

Widget errmsg(String text) {
  //error message widget.
  return Container(
    padding: EdgeInsets.all(15.00),
    margin: EdgeInsets.only(bottom: 10.00),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.red,
        border: Border.all(color: Colors.red, width: 2)),
    child: Row(children: <Widget>[
      Container(
        margin: EdgeInsets.only(right: 6.00),
        child: Icon(Icons.info, color: Colors.white),
      ), // icon for error message

      Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
      //show error message text
    ]),
  );
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
