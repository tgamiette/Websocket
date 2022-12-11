import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'chatPage.dart';

String? currentUserID;

class ListUserPage extends StatefulWidget {
  const ListUserPage({Key? key}) : super(key: key);

  @override
  State<ListUserPage> createState() => _ListUserPage();
}

class _ListUserPage extends State<ListUserPage> {
  @override
  Widget build(BuildContext context) {
    return const ListSection();
  }
}

class ListSection extends StatefulWidget {
  const ListSection({Key? key}) : super(key: key);

  @override
  _ListSectionState createState() => _ListSectionState();
}

class _ListSectionState extends State<ListSection> {
  Future<List> getTopics(jwt) async {
    var url = Uri.parse('http://localhost:3000/api/topics');
    var response = await get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $jwt'
    });
    var topics = json.decode(response.body);
    print(topics);

    return topics;
  }

  @override
  Widget build(BuildContext context) {
    //get JWT token from local storage
    var jwt = GetStorage().read('jwt');

    print(jwt);
    getTopics(jwt);
    return Container();
  }

// void openChat(String userID, String userName, String userPhoto) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//         // builder: (context) => ChatPage(userID, userName, userPhoto)),
//   );
// }
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
    return Container();
  }
}
