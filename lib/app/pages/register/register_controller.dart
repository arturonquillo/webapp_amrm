import 'dart:convert';

import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:webapp_amrm/app/utils/BaseController.dart';
import 'package:webapp_amrm/app/utils/functions.dart';
import 'package:webapp_amrm/app/utils/helpers.dart';
import 'package:webapp_amrm/data/providers/local_storage_service.dart';

class RegisterController extends BaseController {
  var obscurePassword = false.obs;
  var names = "".obs;
  var surnames = "".obs;
  var email = "".obs;
  var celular = "".obs;
  var password = "".obs;
  var phoneNumber = "".obs;
  var showErrors = false.obs;

  String validateNames() {
    String errors = "";
    if (names.value.isEmpty) errors += "El nombre no puede estar vacio";

    if (names.value.length > 30) {
      errors += (errors.isNotEmpty ? "\n" : '') +
          "La longitud excede los 30 caracteres";
    }
    return errors;
  }

  String validateSurnames() {
    String errors = "";
    if (surnames.value.isEmpty) errors += "El apellido no puede estar vacio";

    if (surnames.value.length > 30) {
      errors += (errors.isNotEmpty ? "\n" : '') +
          "La longitud no puede superar los 30 caracteres";
    }
    return errors;
  }

  String validatePhoneNumber() {
    String errors = "";

    if (phoneNumber.value.length < 7) {
      errors += (errors.isNotEmpty ? "\n" : '') +
          "La longitud no puede ser menor a 8 caracteres";
    }

    if (phoneNumber.value.length > 20) {
      errors += (errors.isNotEmpty ? "\n" : '') +
          "La longitud excede los 20 caracteres";
    }

    if (containsLetters(phoneNumber.value)) {
      errors +=
          (errors != "" ? "\n" : "") + "Este campo solo puede contener números";
    }
    return errors;
  }

  String validateEmail() {
    String errors = "";
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (email.value.isEmpty) {
      errors += "El correo no puede estar vacio";
    }
    if (!RegExp(pattern).hasMatch(email.value)) {
      errors += (errors.isNotEmpty ? "\n" : '') +
          "El correo no tiene el formato correcto";
    }
    return errors;
  }

  String validatePassword() {
    String errors = "";
    if (password.value.isEmpty) {
      errors += "La contraseña no puede estar vacia";
    }
    if (password.value.length < 6 && password.value.length > 1) {
      errors += (errors.isNotEmpty ? "\n" : '') +
          "La contraseña no puede ser menor a 6 caracteres";
    }
    if (password.value.length > 20) {
      errors += (errors.isNotEmpty ? "\n" : '') +
          "La longitud excede los 20 caracteres";
    }
    return errors;
  }

  bool hasErrorsFields() {
    return validateNames() == "" &&
        validateSurnames() == "" &&
        validateEmail() == "" &&
        validatePhoneNumber() == "" &&
        validatePassword() == "";

    // validateAddress() == "";
  }

  register() async {
    if (!hasErrorsFields()) {
      showErrors.value = true;
      showNotification("Campos con errores, verifique y vuelva a intentar",
          type: NotificationType.error, duration: const Duration(seconds: 4));
      return;
    }
    String fullname = names.value.trim() + " " + surnames.value.trim();
    Map response = await matildaApiClient.register(
        fullname, email.value, password.value, phoneNumber.value);
    switch (response["code"]) {
      case 200:
        showNotification("Registro exitoso, bienvenido $fullname",
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
