import 'package:get/get.dart';
import 'package:webapp_amrm/app/pages/home/home_view.dart';
import 'package:webapp_amrm/app/pages/login/login_view.dart';
import 'package:webapp_amrm/app/pages/register/register_view.dart';

List<GetPage> getPages() {
  return [
    GetPage(name: "/login", page: () => LoginPage()),
    GetPage(name: "/register", page: () => RegisterPage()),
    GetPage(name: "/home", page: () => HomePage()),
  ];
}
