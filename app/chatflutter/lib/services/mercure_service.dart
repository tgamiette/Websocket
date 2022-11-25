import 'dart:ffi';

import 'package:http/http.dart';
import 'dart:convert';
import 'package:chatflutter/models/user.dart';

class MercureService {
  late String token = "http://localhots:8245/api";
  late String hubUrl = "http://MERCURE_HUB_URL/.well-known/mercure";

  MercureService({required this.token, required this.hubUrl});



  publish({required topic, required Array data}) {
    return post(Uri.parse(hubUrl), body: {
      'topic': topic,
      'data': json.encode(data),
    }, headers: {
      'Authorization': 'Bearer $token'
    });
  }

  Future<void> subscribeTopic({required String topic, required Null Function(dynamic event) onData}) async {
    await get(Uri.parse(hubUrl), headers: {
  }
}
