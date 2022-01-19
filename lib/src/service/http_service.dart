import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:transtour_application/src/model/authentication_model.dart';
import 'package:transtour_application/src/model/travel_taxes.dart';

class HttpService extends ChangeNotifier {
  final String BASE_URL = 'https://transtour.com.ar:8080/api';
  bool isAuthenticated = false;
  Map<String, String> headers = {};

  HttpService() {
    headers.putIfAbsent('Content-type', () => 'application/json');
  }

  Future<void> update(TravelTaxes travel) async {
    var url = Uri.http(BASE_URL, '/travel/v1/updateTaxes');

    var response = await http.post(
      url,
      headers: headers,
      body: travel,
    );

    if (response.statusCode == 401 && response.statusCode == 403) {
      isAuthenticated = false;
      notifyListeners();
    }

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    print(decodedResponse);
  }

  Future<void> authenticate(Authentication authentication) async {
    var client = http.Client();
    try {
      var url = Uri.parse(BASE_URL + '/service-user/v1/user/oauth/token');

      var response = await client.post(
        url,
        // headers: headers,
        body: json.encode(authentication),
      );

      print(response.statusCode.toString());
      print(response.body.toString());

      if (response.statusCode >= 200 && response.statusCode < 300) {
        isAuthenticated = true;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    } finally {
      client.close();
    }
  }
}
