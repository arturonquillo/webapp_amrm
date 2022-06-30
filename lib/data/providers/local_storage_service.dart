import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final storage = new GetStorage();

  static final LocalStorage local = LocalStorage._();
  LocalStorage._();

  String? readValue(String key) {
    String? value = storage.read(key);
    // String? value = GetStorage().read(key);
    return value;
  }

  void saveValue(String key, String value) async {
    storage.write(key, value);
    // GetStorage().write(key, value);
  }

  void listen(void Function() callback) {
    storage.listen(callback);
    GetStorage().listen(callback);
  }

  deleteAll() {
    storage.erase();
  }
}
