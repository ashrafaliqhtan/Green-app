import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_pic_event.dart';
part 'image_pic_state.dart';

class ImagePicBloc extends Bloc<ImagePicEvent, ImagePicState> {
  ImagePicBloc() : super(ImagePicInitial()) {
    on<ImagePicEvent>((event, emit) {});
    on<selectImage>((event, emit) async{
      File avter = await ImagePic();
      emit(ImageState(fileImage1:avter));
    });
  }}

  Future<File> ImagePic() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
        return File(image!.path);
  }