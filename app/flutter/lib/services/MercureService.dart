import 'dart:html';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'mercure_auth_client.dart';

class Mercure {
  final String _mercureUrl = "http://localhost:3000/.well-known/mercure";
  final String _mercureTopic = "https://localhost:8000/api/books/{id}";
  final String hubUrl;
  final String token;

  Mercure({required this.hubUrl, required this.token})
      : assert(hubUrl.isNotEmpty),
        assert(token.isNotEmpty);
  /// Subscribe to one mercure topic
  StreamSubscription<Event> subscribeTopic(
      {required String topic,
      required void Function(Event event) onData,
      required Function onError,
      required void Function() onDone,
      bool? cancelOnError}) =>
    subscribeTopics(
        topics: <String>[topic],
        onData: onData,
        onError: onError,
        onDone: onDone,
        cancelOnError: cancelOnError);


  /// Subscribe to a list of mercure topics
  StreamSubscription<Event> subscribeTopics(
      {required List<String> topics,
        required void Function(Event event) onData,
        required Function onError,
        required void Function() onDone,
        bool? cancelOnError}) {
    var params = topics.map((topic) => 'topic=$topic&').join();
    var eventSource = EventSource('$hubUrl?$params', withCredentials: true);

    return eventSource.onMessage.listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }

  /// Publish data in mercure topic
  Future<int> publish({required String topic, required String data}) async {
    /// Publish data in mercure topic
    var response = await post(
      Uri.parse(hubUrl),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $token',
      },
      body: {'topic': topic, 'data': data},
    );
    return response.statusCode;
  }
}
