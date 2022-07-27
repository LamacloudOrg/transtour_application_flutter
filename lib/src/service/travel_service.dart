import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:transtour_application/src/service/interface_travel_service.dart';

class TravelService implements ITravelService {
  final String BASE_URL = 'https://transtour.com.ar:8080/api';

  //TODO definir los servicios faltantes

  Future<void> updateTaxes() async {}
}
