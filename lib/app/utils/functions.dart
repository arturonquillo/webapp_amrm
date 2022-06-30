import 'dart:math';

import 'package:get/get.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

containsLetters(String value) {
  bool resp = false;

  for (String letter in value.split("")) {
    if (letter.isAlphabetOnly) {
      resp = true;
      break;
    }
  }
  return resp;
}
