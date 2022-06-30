// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webapp_amrm/data/constants.dart';
import 'package:webapp_amrm/app/widgets/CustomButton.dart';
import 'package:webapp_amrm/app/widgets/CustomInputTextField.dart';
import 'package:webapp_amrm/app/widgets/DatePicker.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                  CustomInputTextField(
                    label: "Nombre (s)",
                    hintText: "Ingresa tu (s) nombre (s) legal",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onChanged: (String value) {},
                  ),
                  CustomInputTextField(
                    label: "Apellido",
                    hintText: "Ingresa tu apellido",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onChanged: (String value) {},
                  ),
                  DatePicker(
                    label: "Fecha de nacimiento",
                    hintText: "DD/MM/AAAA",
                    onChanged: (DateTime) {},
                  ),
                  CustomInputTextField(
                    label: "Correo electronico (opcional)",
                    hintText: "Ingresa tu correo electrónico",
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (String value) {},
                  ),
                  CustomInputTextField(
                    label: "Celular",
                    hintText: "Ingresa tu número celular",
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    onChanged: (String value) {},
                  ),
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
                    onTap: () {},
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
