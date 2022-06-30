import 'package:get/get.dart';
import 'package:webapp_amrm/data/providers/matilda_api_provider.dart';

/// Todas los controladores que heredan de BaseController heredan la variable
/// que contiene el api client
class BaseController extends GetxController {
  late MatildaApiProvider matildaApiClient;

  @override
  onInit() {
    super.onInit();
    matildaApiClient = Get.find<MatildaApiProvider>();
  }
}
