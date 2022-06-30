import 'package:get/get.dart';
import 'package:webapp_amrm/app/utils/BaseController.dart';
import 'package:webapp_amrm/app/utils/helpers.dart';

class LoginController extends BaseController {
  var obscurePassword = false.obs;
  var email = "".obs;
  var password = "".obs;
  login() async {
    Map response = await matildaApiClient.login(email.value, password.value);
    print(response);
    switch (response["code"]) {
      case 200:
        showNotification("Inicio de sesion exitoso",
            type: NotificationType.success,
            duration: const Duration(seconds: 4));
        Get.toNamed("home");
        break;
      case 400:
        showNotification(
            "No se ha podido verificar sus credenciales, verifique su correo y contraseña.",
            type: NotificationType.error,
            duration: const Duration(seconds: 4));
        break;
      default:
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
