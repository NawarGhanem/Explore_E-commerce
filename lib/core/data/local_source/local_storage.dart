import 'package:get_storage/get_storage.dart';

import '../../constants/local_storage_keys.dart';

class LocalStorage {
  // GetStorage instance
  final _box = GetStorage();

  // Store a value
  void writeValue(String key, dynamic value) {
    _box.write(key, value);
  }

  dynamic readValue(String key) {
    return _box.read(key);
  }

  bool hasdata(String key) {
    return _box.hasData(key);
  }

// save token
  void setToken(String token) {
    _box.write(LocalStorageKeys.token, token);
  }

  void clearToken() {
    _box.remove(LocalStorageKeys.token);
  }

  String? get getToken {
    return _box.read(LocalStorageKeys.token);
  }
}
