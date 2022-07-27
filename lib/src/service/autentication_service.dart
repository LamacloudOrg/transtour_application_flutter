import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:transtour_application/src/model/authentication.dart';
import 'package:transtour_application/src/service/cliente_http.dart';

class AuthenticationService extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  final String BASE_URL = 'https://transtour.com.ar:8080/api';

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final ClientHtpp clientHtpp = ClientHtpp();

  Future<void> authenticate(Authentication authentication) async {
    var response = await clientHtpp.dio.post(
      BASE_URL + '/service-user/v1/user/oauth/token',
      data: json.encode(authentication),
    );

    var statusCode = response.statusCode ?? 0;

    if (statusCode >= 200 && statusCode < 300) {
      secureStorage.write(key: 'token', value: response.data);
    }
  }

  Future<void> validateToken() async {
    //TODO realizar implementacion en back.
  }

  Future<String> readToken() async {
    return await secureStorage.read(key: 'token') ?? '';
  }

  Future<void> logout() async {
    await secureStorage.delete(key: 'token');
  }
}
