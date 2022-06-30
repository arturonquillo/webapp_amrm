// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:webapp_amrm/app/pages/login/login_controller.dart';
import 'package:webapp_amrm/data/constants.dart';
import 'package:webapp_amrm/app/widgets/CustomButton.dart';
import 'package:webapp_amrm/app/widgets/CustomInputTextField.dart';
import 'package:webapp_amrm/app/widgets/DatePicker.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginController c = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Container(
          color: ConstantColors.primaryColor,
          child: SafeArea(
            bottom: false,
            child: Container(
              color: Colors.white,
              height: Get.height,
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: Get.width,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 12, top: 120),
                          child: Text(
                            "Iniciar sesión",
                            textAlign: TextAlign.left,
                            style: Get.textTheme.headline5!
                                .copyWith(color: ConstantColors.primaryFont),
                          ),
                        ),
                        CustomInputTextField(
                          label: "Número de celular o correo electrónico",
                          hintText: "Ingresa tu celular o correo electrónico",
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          onChanged: (String value) {
                            c.email.value = value;
                          },
                        ),
                        Obx(() {
                          return CustomInputTextField(
                            label: "Contraseña",
                            hintText: "Ingresa tu contraseña",
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            margin: EdgeInsets.only(top: 8),
                            obscureText: c.obscurePassword.value,
                            suffixIcon: SizedBox(
                              height: 20,
                              width: 20,
                              child: IconButton(
                                iconSize: 15,
                                constraints: BoxConstraints(maxHeight: 15),
                                icon: Icon(
                                  c.obscurePassword.value
                                      ? FontAwesome5.eye_slash
                                      : FontAwesome5.eye,
                                ),
                                onPressed: () {
                                  c.obscurePassword.value =
                                      !c.obscurePassword.value;
                                },
                              ),
                            ),
                            onChanged: (String value) {
                              c.password.value = value;
                            },
                          );
                        }),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Olvidé mi contraseña",
                              style: Get.textTheme.bodyMedium!.copyWith(
                                color: ConstantColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: CustomButton(
                      text: "Iniciar sesión",
                      height: 50,
                      width: Get.width,
                      borderRadius: 90.0,
                      backgroundColor:
                          ConstantColors.primaryColor.withOpacity(0.5),
                      textStyle: Get.textTheme.titleMedium!.copyWith(
                        color: ConstantColors.thirdFont,
                      ),
                      onTap: () {
                        c.login();
                        // Get.toNamed("/home");
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("¿Aún no tienes una cuenta?"),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed("/register");
                                },
                                child: Text(
                                  "Regístrate",
                                  style: Get.textTheme.bodyMedium!.copyWith(
                                    color: ConstantColors.primaryColor,
                                  ),
                                ))
                          ],
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Recomienda Monto",
                              style: Get.textTheme.bodyMedium!.copyWith(
                                color: ConstantColors.primaryColor,
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
