import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:webapp_amrm/app/routes.dart';

import 'data/providers/matilda_api_provider.dart';

void main() async {
  Get.put(MatildaApiProvider());

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://f38a0e71c781473c96da010fe23c0997@o1301381.ingest.sentry.io/6537844';
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );
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
