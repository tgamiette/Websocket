import 'dart:async';
// import 'dart:html' as html;

import 'package:universal_html/html.dart';

// import 'package:universal_html/html.dart' as html;

class Sse {
  final EventSource eventSource;
  final StreamController<String> streamController;

  Sse._internal(this.eventSource, this.streamController);

  factory Sse.connect({
    required Uri uri,
    bool withCredentials = false,
    bool closeOnError = true,
  }) {
    final streamController = StreamController<String>();
    final eventSource = EventSource(uri.toString(), withCredentials: withCredentials);

    eventSource.addEventListener('message', (Event message) {
      streamController.add((message as MessageEvent).data as String);
    });

    ///close if the endpoint is not working
    if (closeOnError) {
      eventSource.onError.listen((event) {
        eventSource.close();
        streamController.close();
      });
    }
    return Sse._internal(eventSource, streamController);
  }

  Stream get stream => streamController.stream;

  bool isClosed() => streamController == null || streamController.isClosed;

  void close() {
    eventSource.close();
    streamController.close();
  }
}