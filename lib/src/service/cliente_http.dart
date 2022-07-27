import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class ClientHtpp {
  Map<String, String> headers = {};
  late Dio dio;
  static final ClientHtpp _instance = ClientHtpp._internal();

  factory ClientHtpp() {
    return _instance;
  }

  ClientHtpp._internal() {
    headers.putIfAbsent('Content-type', () => 'application/json');
    dio = Dio();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }
}
