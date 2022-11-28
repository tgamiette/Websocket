import 'package:http/http.dart';
import 'dart:convert';
import '../models/user.dart';

class ApiService {
  static const String baseUrl = "http://localhost:8245";

  static Future<List<User>> getUsers(String token) async {
    final response = await get(Uri.parse('$baseUrl/api/user'), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> users = data["data"];
      return users.map((user) => User.fromJson(user)).toList();
    } else {
      print(response.body);
      throw Exception("Failed to load users");
    }
  }

  static Future<User> getUser(String id, String token) async {
    final response = await get(Uri.parse("${baseUrl}api/user/$id"), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
      "Accept": "application/json",
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> user = data["data"];
      return User.fromJson(user);
    } else {
      print(response.body);
      throw Exception("Failed to load user");
    }
  }

  static Future<User> createUser(User user) async {
    final response = await post(
      Uri.parse('$baseUrl/api/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String?>{
        'name': user.name,
        'email': user.email,
        'password': user.password,
      }),
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> user = data["data"];
      return User.fromJson(user);
    } else {
      print(response.body);
      throw Exception("Failed to create user");
    }
  }

  static Future<User> updateUser(User user) async {
    final response = await put(
      Uri.parse('$baseUrl/api/user/${user.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': user.name,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> user = data["data"];
      return User.fromJson(user);
    } else {
      print(response.body);
      throw Exception("Failed to update user");
    }
  }

  static Future<void> deleteUser(String id) async {
    final response = await delete(Uri.parse('$baseUrl/user/$id'));

    return response.statusCode == 200
        ? null
        : throw Exception("Failed to delete user");
  }

  static Future<dynamic> login(String username, String password) async {
    var auth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    String loginUrl = '${baseUrl}/login'; //api url

    await post(Uri.parse(loginUrl), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': auth
    }).then((response) {
      print(response.body);
      return response.body;
    }) //if success
        .catchError((error) => error); //if error
  }

  static Future<Response> register(User user) async {
    final response = await post(Uri.parse("$baseUrl/register"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String?>{
          'email': user.email,
          'username': user.name,
          'password': user.password,
        }));

    return response;
  }

  static Future<void> logout(String token) async {
    final response =
        await post(Uri.parse("$baseUrl/logout"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    return response.statusCode == 200
        ? null
        : throw Exception("Failed to logout");
  }
}
