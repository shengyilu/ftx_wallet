import 'dart:async';
import 'dart:convert' show utf8;

import 'package:chopper/chopper.dart';
import 'package:crypto/crypto.dart';

class FtxHeaderInterceptor implements RequestInterceptor {
  static const String FTX_KEY = "FTX-KEY";
  static const String FTX_SIGN = "FTX-SIGN";
  static const String FTX_TS = "FTX-TS";
  static const String FTX_SUBACCOUNT = "FTX-SUBACCOUNT";

  static const String API_KEY = "";
  static const String API_SECRET = "";

  @override
  FutureOr<Request> onRequest(Request request) async {
    Request newRequest = request.replace(headers: _generateHeaders(request));
    return newRequest;
  }

  Map<String, String> _generateHeaders(Request request) {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    var headers = Map<String, String>.from(request.headers);
    headers[FTX_KEY] = API_KEY;
    headers[FTX_SIGN] = _getSignature(timestamp, request);
    headers[FTX_TS] = timestamp;
    return headers;
  }

  String _getSignature(String timestamp, Request request) {
    var apiSecret = utf8.encode(API_SECRET);
    print('$timestamp${request.method}${request.url}');
    var signaturePayload =
        utf8.encode('$timestamp${request.method}${request.url}');

    var hmacSha256 = Hmac(sha256, apiSecret);
    var digest = hmacSha256.convert(signaturePayload);

    return digest.toString();
  }
}
