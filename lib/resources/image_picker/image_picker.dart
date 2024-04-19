  import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File> imagePic() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
        return File(image!.path);
  }