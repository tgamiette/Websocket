// import 'package:flutter/material.dart';
// import 'ListUserPage.dart';
//
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
