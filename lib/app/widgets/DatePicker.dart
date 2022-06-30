import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:get/get.dart';
import 'package:webapp_amrm/data/constants.dart';
import 'package:webapp_amrm/app/utils/functions.dart';

class DatePickerController extends GetxController {
  DateTime? datetime;
  String? hintText;
  TextEditingController tController = TextEditingController();
  final void Function(DateTime) onChanged;

  DatePickerController({
    required this.onChanged,
    this.datetime,
    this.hintText,
  });

  changeDateTime(DateTime? datetime) {
    if (datetime == null) return;
    this.datetime = datetime;
    onChanged(datetime);
    tController.text = datetime.toIso8601String().split("T")[0];
    tController.text =
        "${datetime.day.toString().padLeft(2, '0')}/${datetime.month.toString().padLeft(2, '0')}/${datetime.year}";
    // update();
  }

  @override
  void onInit() {
    if (datetime == null)
      tController.text = hintText ?? "";
    else {
      var dt = datetime!.toIso8601String();
      tController.text = dt.split("T")[0];
    }

    super.onInit();
  }
}

class DatePicker extends StatelessWidget {
  final String hintText;
  final String? label;

  final Widget? suffixIcon;
  final DateTime? initialDate;
  final void Function(DateTime) onChanged;
  final int? minimumYear;
  final int? maximumYear;
  final EdgeInsets padding;

  DatePicker({
    Key? key,
    this.hintText = "",
    required this.onChanged,
    this.suffixIcon,
    this.initialDate,
    this.minimumYear,
    this.maximumYear,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 35),
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DatePickerController c = Get.put(
      DatePickerController(
          datetime: initialDate, hintText: hintText, onChanged: onChanged),
      tag: getRandomString(10),
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          if (label != null)
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 8),
              child: Text(label!),
            ),
          SizedBox(
            height: 42,
            child: TextFormField(
              controller: c.tController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.white,
              readOnly: true,
              onTap: () async {
                showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext builder) {
                      return Container(
                        height: MediaQuery.of(context).copyWith().size.height *
                            0.25,
                        color: Colors.white,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (value) {
                            c.changeDateTime(value);
                          },
                          initialDateTime: DateTime.now(),
                          minimumYear: 2019,
                          maximumYear: 2029,
                        ),
                      );
                    });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 14, top: 0),
                suffixIcon: IconButton(
                  icon: Icon(Elusive.calendar),
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext builder) {
                          return Container(
                            height:
                                MediaQuery.of(context).copyWith().size.height *
                                    0.25,
                            color: Colors.white,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (value) {
                                c.changeDateTime(value);
                              },
                              initialDateTime: DateTime.now(),
                              minimumYear: 2019,
                              maximumYear: 2029,
                            ),
                          );
                        });
                  },
                ),
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
          ),
        ],
      ),
    );
  }
}
