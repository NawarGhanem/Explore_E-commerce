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

  // Remove a value
  void removeValue(String key) {
    _box.remove(key);
  }

  // Clear all stored values
  void clearAll() {
    _box.erase();
  }

// save token
  void setToken(String token) {
    _box.write(LocalStorageKeys.token, token);
  }

  Future<void> setUseBiometric(bool value) async {
    await _box.write(LocalStorageKeys.useBiometric, value);
  }

  void clearToken() {
    _box.remove(LocalStorageKeys.token);
  }

  String? get getToken {
    return _box.read(LocalStorageKeys.token);
  }

  String? get checkPin {
    return _box.read(LocalStorageKeys.localpassword);
  }
}

// bool? get isDarkmode {
//   return _box.read(LocalStorageKeys.theme);
// }

// void setIsDarkMode(bool mode) {
//   _box.write(LocalStorageKeys.theme, mode);
// }
