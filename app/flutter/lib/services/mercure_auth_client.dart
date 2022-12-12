
import 'dart:html';

import 'package:http/http.dart';

class AuthClient extends BaseClient {
  final String _token;
  final _inner;

  @override
  AuthClient(this._token, this._inner);

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['Authorization'] = 'Bearer $_token';
    return _inner.send(request);
  }
}