// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:webapp_amrm/app/pages/register/register_controller.dart';
import 'package:webapp_amrm/data/constants.dart';
import 'package:webapp_amrm/app/widgets/CustomButton.dart';
import 'package:webapp_amrm/app/widgets/CustomInputTextField.dart';
import 'package:webapp_amrm/app/widgets/DatePicker.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final RegisterController c = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Container(
          color: ConstantColors.thirdFont,
          child: SafeArea(
            bottom: false,
            child: Container(
              color: Colors.white,
              height: Get.height,
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: Get.width,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close,
                          color: ConstantColors.primaryFont,
                        )),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 12),
                    child: Text(
                      "Información personal",
                      textAlign: TextAlign.left,
                      style: Get.textTheme.headline5!
                          .copyWith(color: ConstantColors.primaryFont),
                    ),
                  ),
                  Obx(() {
                    return CustomInputTextField(
                      label: "Nombre (s)",
                      error: c.validateNames(),
                      showError: c.showErrors.value,
                      hintText: "Ingresa tu (s) nombre (s) legal",
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onChanged: (String value) {
                        c.names.value = value;
                      },
                    );
                  }),
                  Obx(() {
                    return CustomInputTextField(
                      label: "Apellido",
                      error: c.validateSurnames(),
                      showError: c.showErrors.value,
                      hintText: "Ingresa tu apellido",
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onChanged: (String value) {
                        c.surnames.value = value;
                      },
                    );
                  }),
                  DatePicker(
                    label: "Fecha de nacimiento",
                    hintText: "DD/MM/AAAA",
                    onChanged: (DateTime) {},
                  ),
                  Obx(() {
                    return CustomInputTextField(
                      label: "Correo electronico (opcional)",
                      error: c.validateEmail(),
                      showError: c.showErrors.value,
                      hintText: "Ingresa tu correo electrónico",
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: (String value) {
                        c.email.value = value;
                      },
                    );
                  }),
                  Obx(() {
                    return CustomInputTextField(
                      label: "Celular",
                      error: c.validatePhoneNumber(),
                      showError: c.showErrors.value,
                      hintText: "Ingresa tu número celular",
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      onChanged: (String value) {
                        c.phoneNumber.value = value;
                      },
                    );
                  }),
                  Obx(() {
                    return CustomInputTextField(
                      label: "Contraseña",
                      error: c.validatePassword(),
                      showError: c.showErrors.value,
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
                            c.obscurePassword.value = !c.obscurePassword.value;
                          },
                        ),
                      ),
                      onChanged: (String value) {
                        c.password.value = value;
                      },
                    );
                  }),
                  Container(
                    height: 50,
                  ),
                  CustomButton(
                    text: "Siguiente",
                    height: 50,
                    width: Get.width,
                    borderRadius: 90.0,
                    backgroundColor:
                        ConstantColors.primaryColor.withOpacity(0.5),
                    textStyle: Get.textTheme.titleMedium!.copyWith(
                      color: ConstantColors.thirdFont,
                    ),
                    onTap: () {
                      c.register();
                    },
                  ),
                  CustomButton(
                    text: "Cancelar",
                    height: 50,
                    width: Get.width,
                    borderRadius: 90.0,
                    backgroundColor: Colors.white,
                    textStyle: Get.textTheme.titleMedium!.copyWith(
                      color: ConstantColors.primaryColor,
                    ),
                    onTap: () {},
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
