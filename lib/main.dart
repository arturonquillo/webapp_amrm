import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webapp_amrm/app/routes.dart';

import 'data/providers/matilda_api_provider.dart';

void main() {
  Get.put(MatildaApiProvider());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mattilda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Opinion",
        primarySwatch: Colors.blue,
      ),
      getPages: getPages(),
      initialRoute: "/login",
    );
  }
}
