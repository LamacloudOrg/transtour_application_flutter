import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:transtour_application/src/model/authentication.dart';

class HttpService {
  final String BASE_URL = 'https://transtour.com.ar:8080/api';
  bool isAuthenticated = false;
  Map<String, String> headers = {};
  late Dio dio;

  HttpService() {
    headers.putIfAbsent('Content-type', () => 'application/json');
    dio = Dio();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<void> authenticate(Authentication authentication) async {
    try {
      var response = await dio.post(
        BASE_URL + '/service-user/v1/user/oauth/token',
        // headers: headers,
        data: json.encode(authentication),
      );

      var statusCode = response.statusCode ?? 0;
      // TODO  retorna ok o error.
    } catch (e) {
      print(e.toString());
    } finally {
      //client.close();
    }
  }
}
