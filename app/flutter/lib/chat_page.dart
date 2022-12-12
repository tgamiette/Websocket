import 'package:WhatsAppClone/services/api_service.dart';
import 'package:WhatsAppClone/services/sseService.dart';
import 'package:WhatsAppClone/widgets/conversationList.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'ListUserPage.dart';
import 'models/chatUserModel.dart';
import 'models/message.dart';

//
// String currentUserID = auth.currentUser!.uid;
//
//
// class ChatPage extends StatelessWidget {
//   final String otherUserID;
//   final String otherUserName;
//   final String otherUserPhoto;
//   const ChatPage(this.otherUserID, this.otherUserName, this.otherUserPhoto,
//       {Key? key})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     print(otherUserID);
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             CircleAvatar(
//               backgroundImage: NetworkImage(otherUserPhoto),
//             ),
//             const SizedBox(width: 20),
//             Text(
//               otherUserName,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(10),
//         color: Colors.grey.shade100,
//         height: double.infinity,
//         child: ListSection(otherUserID),
//       ),
//       bottomNavigationBar: MessageField(otherUserID),
//     );
//   }
// }
//
// class MessageField extends StatelessWidget {
//   final String otherUserID;
//   final textField = TextEditingController();
//   MessageField(this.otherUserID, {Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Transform.translate(
//       offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
//       child: BottomAppBar(
//         child: Container(
//           height: 50,
//           padding: const EdgeInsets.symmetric(vertical: 2),
//           child: Row(
//             children: [
//               IconButton(icon: const Icon(Icons.camera_alt), onPressed: () {}),
//               IconButton(icon: const Icon(Icons.image), onPressed: () {}),
//               IconButton(icon: const Icon(Icons.voice_chat), onPressed: () {}),
//               Expanded(
//                 child: TextField(
//                   controller: textField,
//                   decoration: const InputDecoration(
//                     border: InputBorder.none,
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Entrez votre  message',
//                   ),
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.arrow_forward),
//                 onPressed: () => sendMessage(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void sendMessage() {
//     DateTime now = DateTime.now();
//     String formattedDate = DateFormat('yyyy-MM-dd – kk:mm:ss').format(now);
//     try {
//       chatRef.doc(currentUserID).collection(otherUserID).add({
//         'text': textField.text,
//         'userID': currentUserID,
//         'date': formattedDate,
//       }).then((value) {
//         chatRef.doc(otherUserID).collection(currentUserID).add({
//           'text': textField.text,
//           'userID': currentUserID,
//           'date': formattedDate,
//         }).then((value) {
//           userRef
//               .doc(otherUserID)
//               .collection('Messages')
//               .doc(currentUserID)
//               .set({
//             'lastMessage': textField.text,
//           }).then((value) {
//             textField.clear();
//             print('Message envoyé!');
//           });
//         });
//       });
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
//
// class ListSection extends StatefulWidget {
//   final String otherUserID;
//   const ListSection(this.otherUserID, {Key? key}) : super(key: key);
//   @override
//   _ListSectionState createState() => _ListSectionState();
// }
//
// class _ListSectionState extends State<ListSection> {
//   late List<DocumentSnapshot> _docs;
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: chatRef
//           .doc(currentUserID)
//           .collection(widget.otherUserID)
//           .orderBy('date')
//           .snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) return const Center(child: Text('Chargement'));
//         _docs = snapshot.data!.docs;
//         if (_docs.isEmpty) {
//           return const Center(child: Text('Envoyez votre premier message'));
//         }
//         return SingleChildScrollView(
//           child: Column(
//             children: _docs.map((document) {
//               return document['userID'] == currentUserID
//                   ? CurrentUserMessage(document['text'], document['date'])
//                   : OtherUserMessage(document['text'], document['date']);
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
// }
//
// class CurrentUserMessage extends StatelessWidget {
//   final String textMessage;
//   final String dateMessage;
//   const CurrentUserMessage(this.textMessage, this.dateMessage, {Key? key})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Text(
//             dateMessage.toString().substring(13, 18),
//             style: TextStyle(
//               color: Colors.grey[400],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//             height: 30,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.blue,
//             ),
//             child: Center(
//               child: Text(
//                 textMessage,
//                 style: const TextStyle(color: Colors.white, fontSize: 17),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class OtherUserMessage extends StatelessWidget {
//   final String textMessage;
//   final String dateMessage;
//   const OtherUserMessage(this.textMessage, this.dateMessage, {Key? key})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//             height: 30,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.grey.shade300,
//             ),
//             child: Center(
//               child: Text(
//                 textMessage,
//                 style: const TextStyle(fontSize: 17),
//               ),
//             ),
//           ),
//           Text(
//             dateMessage.toString().substring(13, 18),
//             style: TextStyle(
//               color: Colors.grey.shade400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late bool showProgress;
  late List chatUsers;
  late String jwt;

  @override
  void initState() {
    showProgress = false;
    jwt = GetStorage().read('jwt');
    chatUsers = [
      ChatUsers(
          name: "Jane Russel",
          messageText: "Awesome Setup",
          imageURL: "https://randomuser.me/api/portraits/men/8.jpg",
          time: "Now"),
      ChatUsers(
          name: "Glady's Murphy",
          messageText: "That's Great",
          imageURL: "https://randomuser.me/api/portraits/men/5.jpg",
          time: "Yesterday"),
      ChatUsers(
          name: "Jorge Henry",
          messageText: "Hey where are you?",
          imageURL: "https://randomuser.me/api/portraits/men/1.jpg",
          time: "31 Mar"),
      ChatUsers(
          name: "Philip Fox",
          messageText: "Busy! Call me in 20 mins",
          imageURL: "https://randomuser.me/api/portraits/men/2.jpg",
          time: "28 Mar"),
      ChatUsers(
          name: "Debra Hawkins",
          messageText: "Thankyou, It's awesome",
          imageURL: "https://randomuser.me/api/portraits/men/5.jpg",
          time: "23 Mar"),
      ChatUsers(
          name: "Jacob Pena",
          messageText: "will update you in evening",
          imageURL: "https://randomuser.me/api/portraits/men/9.jpg",
          time: "17 Mar"),
      ChatUsers(
          name: "Andrey Jones",
          messageText: "Can you please share the file?",
          imageURL: "https://randomuser.me/api/portraits/men/3.jpg",
          time: "24 Feb"),
      ChatUsers(
          name: "John Wick",
          messageText: "How are you?",
          imageURL: "https://randomuser.me/api/portraits/men/4.jpg",
          time: "18 Feb"),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ApiService.getChatsUsers(jwt).then((data) {
      setState(() {
        chatUsers = data;
      });
    });


      var myStream = Sse.connect(
        uri: Uri.parse('https://example.com/my-private-topic'),
        closeOnError: false,
        withCredentials: true,
      ).stream;

      // myStream.listen((event) {
      //   print('Received:${DateTime.now().millisecondsSinceEpoch} : $event');
      // });



    return Scaffold(
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Conversations",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.pink,
                            size: 20,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Add New",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

