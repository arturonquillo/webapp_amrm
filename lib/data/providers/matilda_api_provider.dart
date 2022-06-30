import 'dart:convert';

import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'secure_storage_service.dart';

class MatildaApiProvider extends GetConnect {
  static const String _baseUrl = "https://demo.treblle.com/api/v1/";
  static const String _user = "auth/";
  static const String _notas = "notas/";

  @override
  void onInit() {
    httpClient.baseUrl = _baseUrl;
    httpClient.timeout = const Duration(seconds: 30);

    httpClient.addRequestModifier<Object?>((request) async {
      String? token = await SecureStorage.secure.readValue("token");
      request.headers['Authorization'] = "Bearer $token";
      return request;
    });

    super.onInit();
  }

  Future<Map> login(String email, String password) async {
    Map responseMap = {};
    try {
      var response = await post(
          _user + "login", json.encode({'email': email, 'password': password}),
          headers: {
            "content-type": "application/json",
            "accept": "application/json"
          });
      responseMap = _response(response);

      return responseMap;
    } catch (error, stackTrace) {
      await Sentry.captureException(
        error,
        stackTrace: stackTrace,
      );
      return responseMap;
    }
  }

  Future<Map> register(
      String name, String email, String password, String phoneNumber) async {
    Map responseMap = {};
    try {
      var response = await post(
          _user + "register",
          json.encode({
            'name': name,
            'email': email,
            'password': password,
            'phone_number': phoneNumber
          }),
          headers: {
            "content-type": "application/json",
            "accept": "application/json"
          });
      responseMap = _response(response);

      return responseMap;
    } catch (error, stackTrace) {
      await Sentry.captureException(
        error,
        stackTrace: stackTrace,
      );
      return responseMap;
    }
  }

  Map _response(Response response) {
    Map r = response.body;
    response.printError();
    switch (response.statusCode) {
      case 500:
        print("No internet conexion");

        return r;
      default:
        return r;
    }
  }
}
