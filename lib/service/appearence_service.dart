import 'package:get_storage/get_storage.dart';

// Method to change the theme
class AppearanceServices {
  String currentTheme = 'Light';
  final box = GetStorage();

  Future<void> changeTheme() async {
    if (currentTheme == 'Dark') {
      await box.write('theme', 'Light');
      currentTheme = 'Light';
    } else {
      await box.write('theme', 'Dark');
      currentTheme = 'Dark';
    }
    box.save();
  }

  // Method to get the theme
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
