import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
// ignore: unused_import
import 'package:path_provider/path_provider.dart';
import 'package:http/io_client.dart';
import 'package:transtour_application/src/model/authentication_model.dart';
import 'package:transtour_application/src/model/travel_taxes.dart';

class HttpService extends ChangeNotifier {
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

  Future<void> update(TravelTaxes travel) async {
    // var url = Uri.https(BASE_URL, '/travel/v1/updateTaxes');

    var response =
        await dio.post(BASE_URL + '/travel/v1/updateTaxes', data: travel);

    if (response.statusCode == 401 && response.statusCode == 403) {
      isAuthenticated = false;
      notifyListeners();
    }

    var decodedResponse = jsonDecode(utf8.decode(response.data)) as Map;
    print(decodedResponse);
  }

  Future<void> authenticate(Authentication authentication) async {
    try {
      //var url = Uri.https(BASE_URL, '/service-user/v1/user/oauth/token');

      var response = await dio.post(
        BASE_URL + '/service-user/v1/user/oauth/token',
        // headers: headers,
        data: json.encode(authentication),
      );

      var statusCode = response.statusCode ?? 0;
      if (statusCode >= 200 && statusCode < 300) {
        isAuthenticated = true;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    } finally {
      //client.close();
    }
  }
}
