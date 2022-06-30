import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webapp_amrm/data/constants.dart';

/// Notifications
enum NotificationType { success, information, error }

String getTitleText(NotificationType type) {
  String title = "Exito !";
  switch (type) {
    case NotificationType.information:
      title = "Información !";
      break;
    case NotificationType.success:
      title = "Exito !";
      break;
    case NotificationType.error:
      title = "Algo ha salido mal !";
      break;
  }
  return title;
}

Widget getIcon(NotificationType type) {
  String assetPathIcon = "";
  Color color = ConstantColors.primaryColor;
  switch (type) {
    case NotificationType.success:
      assetPathIcon = ConstantImages.blushingGif;
      color = Colors.green.shade300;
      break;
    case NotificationType.error:
      assetPathIcon = ConstantImages.cryingGif;
      color = Colors.redAccent;
      break;
    case NotificationType.information:
      assetPathIcon = ConstantImages.blushingGif;
      color = Colors.yellow.shade700;
      break;
  }
  return Container(
    height: 40,
    width: 0,
    child: Image.asset(
      assetPathIcon,
      color: color,
      colorBlendMode: BlendMode.lighten,
      fit: BoxFit.fitHeight,
    ),
  );
}

showNotification(String message,
    {NotificationType type = NotificationType.success,
    Duration duration = const Duration(seconds: 2),
    void Function(GetSnackBar)? onTap}) {
  Get.showSnackbar(GetSnackBar(
    titleText: Text(
      getTitleText(type),
      style: Get.textTheme.headline6!.copyWith(
        color: ConstantColors.primaryColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    boxShadows: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 10,
        spreadRadius: 3.0,
      ),
    ],
    onTap: onTap ??
        (GetSnackBar obj) {
          if (Get.isSnackbarOpen) Get.back();
        },
    messageText: Text(
      message,
      style: Get.textTheme.subtitle1!.copyWith(
        color: ConstantColors.primaryFont,
      ),
    ),
    duration: duration,
    snackPosition: SnackPosition.TOP,
    // padding: EdgeInsets.Ínly(left: 100),
    margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
    borderRadius: 12,
    snackStyle: SnackStyle.FLOATING,
    backgroundColor: Colors.white,
    // padding: EdgeInsets.zero,
    padding: const EdgeInsets.only(left: 20, right: 5, top: 5, bottom: 5),
    icon: getIcon(type),
    barBlur: 100,
  ));
}
