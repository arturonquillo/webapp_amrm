import 'dart:convert';

import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:webapp_amrm/app/utils/BaseController.dart';
import 'package:webapp_amrm/app/utils/helpers.dart';
import 'package:webapp_amrm/data/providers/local_storage_service.dart';

class LoginController extends BaseController {
  var obscurePassword = true.obs;
  var email = "".obs;
  var password = "".obs;

  login() async {
    Map response = await matildaApiClient.login(email.value, password.value);
    switch (response["code"]) {
      case 200:
        showNotification(
            "Inicio de sesión exitoso, bienvenido ${response["user"]["name"]}",
            type: NotificationType.success,
            duration: const Duration(seconds: 4));

        Get.toNamed("home");
        try {
          LocalStorage.local.saveValue('user', json.encode(response["user"]));
        } catch (error, stackTrace) {
          await Sentry.captureException(
            error,
            stackTrace: stackTrace,
          );
        }
        break;
      case 400:
        showNotification(
            "No se ha podido verificar sus credenciales, verifique su correo y contraseña.",
            type: NotificationType.error,
            duration: const Duration(seconds: 4));
        break;
      default:
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
