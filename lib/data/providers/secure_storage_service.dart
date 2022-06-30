import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  static final SecureStorage secure = SecureStorage._();
  SecureStorage._();

  Future<bool> hasData(String key) async {
    bool resp = false;
    // print(await _storage.read(key: key));
    if (await _storage.read(key: key) != null) {
      resp = (await _storage.read(key: key)).toString().trim() != "";
    }

    return resp;
  }

  Future<String?> readValue(String key) async {
    String? value = await _storage.read(key: key);
    return value;
  }

  Future<void> saveValue(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  deleteAll() {
    _storage.deleteAll();
  }
}
