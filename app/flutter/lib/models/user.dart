class User {
  final int id;
  final String name;
  final String? email;
  final String? password;

  User({required this.id, required this.name, this.email, this.password});
  
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, password: $password}';
  }
}
