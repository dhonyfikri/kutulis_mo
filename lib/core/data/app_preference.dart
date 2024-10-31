import 'package:get_storage/get_storage.dart';

class AppPreference {
  final GetStorage storage;

  AppPreference(this.storage);

  void clearAll() {
    storage.erase();
  }
}
