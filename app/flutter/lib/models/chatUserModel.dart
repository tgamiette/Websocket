class ChatUsers{
  String name;
  String messageText;
  String imageURL;
  String time;
  ChatUsers({required this.name, required this.messageText,  required this.imageURL,  required this.time});

   factory ChatUsers.fromJson(Map<String, dynamic> json) {
    return ChatUsers(
      name: json['username'] as String,
      messageText: 'ttfdfdfd',
      imageURL: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
      time: 'Now',
    );
  }
}