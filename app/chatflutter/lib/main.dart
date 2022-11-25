import 'dart:async';
import 'package:chatflutter/ListUserPage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'LoginApp.dart';

Future<void> main() async {
//   var token = 'eyJhbGciOiJIUzI1NiJ9.eyJtZXJjdXJlIjp7InB1Ymxpc2giOlsiKiJdLCJzdWJzY3JpYmUiOlsiaHR0cHM6Ly9leGFtcGxlLmNvbS9teS1wcml2YXRlLXRvcGljIl0sInBheWxvYWQiOnsidXNlciI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXNlcnMvRWxpc2UiLCJyZW1vdGVBZGRyIjoiMTI3LjAuMC4xIn19fQ.jZt0IB8qv49o1hGw0PMt99q7k_Wn4Q6KuK-Uh9gFb6E';
//   var hubUrl = 'http://MERCURE_HUB_URL/.well-known/mercure';
//   var topic = 'https://example.com/my-private-topic';
//
//   var mercure = MercureService(token: token, hubUrl: hubUrl);
//   // Subscribe to topic
//   mercure.subscribeTopic(topic: topic, onData: (Event event) {
//     print(event.data);
//   });  // Subscribe to topic
// // Publish on topic
//   mercure.publish(topic: topic, data: 'DATA').then((status) {
//     if(status == 200) {
//       print('Message Sent');
//     }
//     else {
//       print('Message Failed with code : $status');
//     }
//   });
  GetStorage.init();
  var user = GetStorage().read('user');

  if (user == null) {
    print('User is currently signed out!');
    // runApp(const ListSection());
    runApp(const LoginApp());
  } else {
    //   print('User is signed in!');
    //   runApp( HomePage());
    // }
    runApp(const HomePage());
  }
  await Future.delayed(const Duration(seconds: 2));
  GetStorage().write('user', 'user');

}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Chat App"),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Text("Hello World"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Envoyer un nouveau message',
        onPressed: () => {_showOptions(context)},
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.all(30),
          height: 200,
          child: Column(
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => {},
                child: const Text("Ajouter"),
              ),
            ],
          ),
        );
      },
    );
  }
}