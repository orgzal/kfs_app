import 'package:get_storage/get_storage.dart';

class StorageService {
  StorageService({GetStorage? storage}) : _storage = storage ?? GetStorage();

  final GetStorage _storage;

  Future<void> write(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  T? read<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> remove(String key) async {
    await _storage.remove(key);
  }

  Future<void> clear() async {
    await _storage.erase();
  }
}
