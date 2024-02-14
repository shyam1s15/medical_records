import 'package:get_storage/get_storage.dart';

class AppPreferences {
  static final _pref = GetStorage();

  static void init() async {
    await GetStorage.init();
  }

  static String? get userToken => _pref.read('userToken');

  static set userToken(String? value) => _pref.write('userToken', value);

  // Add more preferences as needed
}
