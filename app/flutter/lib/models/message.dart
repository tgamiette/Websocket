
class Message {
  final int id;
  final String content;
  final String date;
  final int user;

  Message({required this.id, required this.content, required this.date, required this.user});
  
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['_id'] as int,
      content: json['content'] as String,
      date: json['date'] as String,
      user: json['user'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'content': content,
      'date': date,
      'user': user,
    };
  }

  @override
  String toString() {
    return 'User{id: $id content: $content, date: $date, user: $user}';
  }
}
