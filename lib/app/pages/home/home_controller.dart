import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:webapp_amrm/app/utils/BaseController.dart';
import 'package:webapp_amrm/data/providers/local_storage_service.dart';

class HomeController extends BaseController {
  var fullname = "".obs;

  @override
  void onInit() async {
    try {
      String? userData = LocalStorage.local.readValue("user");
      if (userData != null) {
        Map user = json.decode(userData);
        fullname.value = user["name"];
      }
    } catch (error, stackTrace) {
      await Sentry.captureException(
        error,
        stackTrace: stackTrace,
      );
    }

    super.onInit();
  }
}
