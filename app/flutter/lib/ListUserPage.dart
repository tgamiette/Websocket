import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat_page.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference usersRef = firestore.collection('Users');
String? currentUserID;

class ListUserPage extends StatelessWidget {
  const ListUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ListSection extends StatefulWidget {
  const ListSection({Key? key}) : super(key: key);

  @override
  _ListSectionState createState() => _ListSectionState();
}

class _ListSectionState extends State<ListSection> {
  late List<DocumentSnapshot> _docs;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: usersRef.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const LinearProgressIndicator();
        _docs = snapshot.data!.docs;
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 40),
          child: Column(
            children: _docs.map((document) {
              if (document.id != currentUserID) {
                return InkWell(
                  onTap: () => openChat(
                      document.id, document['pseudo'], document['photoUrl']),
                  child: UserLineDesign(
                      document.id, document['pseudo'], document['photoUrl']),
                );
              } else {
                return Container();
              }
            }).toList(),
          ),
        );
      },
    );
  }

  void openChat(String userID, String userName, String userPhoto) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChatPage(userID, userName, userPhoto)),
    );
  }
}

class UserLineDesign extends StatelessWidget {
  final String _userID;
  final String _pseudo;
  final String _photoUrl;
  const UserLineDesign(this._userID, this._pseudo, this._photoUrl, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
      child: Row(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: CircleAvatar(
              backgroundImage: NetworkImage(_photoUrl),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_pseudo,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              GetLastMessage(_userID),
            ],
          ),
        ],
      ),
    );
  }
}

class GetLastMessage extends StatelessWidget {
  final String otherUserID;
  const GetLastMessage(this.otherUserID, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CollectionReference users = firestore.collection('Users');
    return FutureBuilder<DocumentSnapshot>(
      future: users
          .doc(currentUserID)
          .collection('Messages')
          .doc(otherUserID)
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Un problème est survenu');
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Aucun message");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> document =
          snapshot.data!.data() as Map<String, dynamic>;
          return Text(document['lastMessage'],
              style: const TextStyle(fontSize: 17));
        }
        return const Text(
          'Chargement',
          style: TextStyle(fontSize: 17, color: Colors.grey),
        );
      },
    );
  }
}
