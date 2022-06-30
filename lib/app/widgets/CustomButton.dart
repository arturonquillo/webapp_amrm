import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webapp_amrm/data/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double borderRadius;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final Function() onTap;

  const CustomButton({
    Key? key,
    required this.text,
    this.width,
    this.height,
    this.borderRadius = 18.0,
    this.textStyle,
    this.backgroundColor = ConstantColors.primaryColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
          onPressed: onTap,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                // side: BorderSide(color: ConstantColors.primaryColor),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          ),
          child: Text(
            text,
            style: textStyle ??
                Get.textTheme.bodyMedium!.copyWith(
                  color: ConstantColors.thirdFont,
                  fontWeight: FontWeight.normal,
                ),
          )),
    );
  }
}
