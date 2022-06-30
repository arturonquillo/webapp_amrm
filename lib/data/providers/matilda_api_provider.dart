import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'local_storage_service.dart';
import 'secure_storage_service.dart';

class MatildaApiProvider extends GetConnect {
  static String _baseUrl = "https://demo.treblle.com/api/v1/";
  static String _user = "auth/";

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
      print(email);
      print(password);
      print(_user + "/login");

      // if (response.statusCode == 200) {
      //   String token = responseMap["data"]['token'];
      //   await SecureStorage.secure.saveValue("token", token);
      // }

      return responseMap;
    } catch (e) {
      print(e);
      return responseMap;
    }
  }

  // Future<Map> changePassword(String currentPassword, String newPassword) async {
  //   Map responseMap = {};
  //   String? email = LocalStorage.local.readValue("user_email");

  //   try {
  //     var response = await put(
  //         _cuentasPath,
  //         json.encode({
  //           "email": email,
  //           "contrasenaActual": currentPassword,
  //           "contrasenaNueva": newPassword
  //         }),
  //         headers: {
  //           "Content-Type": "application/json-patch+json",
  //           "accept": "application/json"
  //         });
  //     responseMap = _response(response);

  //     if (response.statusCode == 200) {}

  //     return responseMap;
  //   } catch (e) {
  //     print(e);
  //     return responseMap;
  //   }
  // }

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
