import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webapp_amrm/data/constants.dart';

class CustomInputTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final EdgeInsets margin;
  final Widget? suffixIcon;
  final bool obscureText;
  final Function(String value) onChanged;
  final bool showError;
  final bool autocorrect;
  final String? error;

  const CustomInputTextField({
    Key? key,
    this.label,
    this.hintText,
    this.textInputAction,
    this.keyboardType,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.suffixIcon,
    this.obscureText = false,
    required this.onChanged,
    this.error,
    this.showError = false,
    this.autocorrect = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        children: [
          if (label != null)
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 8),
              child: Text(
                label!,
                style: Get.textTheme.titleMedium!.copyWith(
                  color: ConstantColors.primaryColor500,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          TextFormField(
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            obscureText: obscureText,
            onChanged: onChanged,
            autocorrect: autocorrect,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              errorText: showError && error != "" ? error : null,
              contentPadding: EdgeInsets.only(left: 14),
              // label: label != null ? Text(label!) : null,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: hintText,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ConstantColors.primaryFont.withOpacity(0.3),
                    width: 2,
                  )),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ConstantColors.primaryFont.withOpacity(0.15),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ConstantColors.primaryFont.withOpacity(0.15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
