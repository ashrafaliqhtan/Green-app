import 'package:get_storage/get_storage.dart';

  // Method to change the theme
  class AppearanceServices {
  String currentTheme = 'Light';
  final box = GetStorage();

  AppearanceServices(){
    getTheme();
  }

 Future<void> changeTheme() async{
    if (currentTheme == 'Dark') {
      await box.write('qq', 'Light');
      currentTheme = 'Light';
    } else {
       await box.write('qq', 'Dark');
      currentTheme = 'Dark';
    }
   box.save();
  }
  // Method to get the theme
  getTheme()  {
    if (box.read('qq') == null) {
       box.write('qq', currentTheme);
    } else {
      currentTheme = box.read('qq');
    }
  }
}