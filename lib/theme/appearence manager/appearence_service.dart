import 'package:get_storage/get_storage.dart';

class AppearanceServices {
  String currentTheme = 'Light';
  final box = GetStorage();

 void changeTheme() {
    if (currentTheme == 'Dark') {
      box.write('theme', 'Light');
      currentTheme = 'Light';
      //
    } else {
      box.write('theme', 'Dark');
      currentTheme = 'Dark';
    }
  }
   
  // Get Theme
  void getTheme() {

    if (box.read('theme') == null) {
      box.write('theme', currentTheme);
    }
  }

 
}
