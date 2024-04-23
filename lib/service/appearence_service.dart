import 'package:get_storage/get_storage.dart';

class AppearanceServices {
  String currentTheme = 'Dark';
  final box = GetStorage();


  isDark({required bool isDark}) async {
    if (!isDark) {
      await box.write("mode", "Light");
    } else {
      await box.write("mode", "Dark");
    }
  }

  Future getMode() async {
    if (!box.hasData('mode')) {
      await box.write("mode", "Light");
      currentTheme = 'Light';
    } else {
      String modeValue = box.read('mode');
      currentTheme = modeValue;
    }
  }
}
