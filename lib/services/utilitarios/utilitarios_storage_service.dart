import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UtilitariosStorageService {
  static const flutterSecureStorage = FlutterSecureStorage();

  static Future<void> almacenar(String key, value) async {
    await flutterSecureStorage.write(key: key, value: value);
  }

  static Future<String?> retornar(String key) async {
    return await flutterSecureStorage.read(key: key);
  }

  static Future<void> eliminar(String key) async {
    await flutterSecureStorage.delete(key: key);
  }
}
