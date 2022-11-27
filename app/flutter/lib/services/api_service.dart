import 'package:http/http.dart';
import 'dart:convert';
import 'package:chatflutter/models/user.dart';

class ApiService {
  static const String baseUrl = "http://localhots:8245/api";
  static const String users = "/users";

  static Future<List<User>> getUsers(String token) async {
    final response = await get(Uri.parse(baseUrl + users), headers: {
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
    final response = await get(Uri.parse(baseUrl + users + "/$id"), headers: {
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
      Uri.parse(baseUrl + users),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': user.name,
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
      Uri.parse(baseUrl + users + "/${user.id}"),
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
    final response = await delete(Uri.parse(baseUrl + users + "/$id"));
    if (response.statusCode != 204) {
      print(response.body);
      throw Exception("Failed to delete user");
    }
  }

  static Future<String> login(String email, String password) async {
    final response = await post(
      Uri.parse(baseUrl + "/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data["token"];
    } else {
      print(response.body);
      throw Exception("Failed to login");
    }
  }

  static Future<String> register(String email, String password) async {
    final response = await post(
      Uri.parse(baseUrl + "/register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data["token"];
    } else {
      print(response.body);

      throw Exception("Failed to register");
    }
  }

  static Future<void> logout(String token) async {
    final response = await post(
        Uri.parse(baseUrl + "/logout"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    if (response.statusCode != 204) {
      throw Exception("Failed to logout");
    }
  }



}
