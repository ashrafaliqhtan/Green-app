import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_pic_event.dart';
part 'image_pic_state.dart';

class ImagePicBloc extends Bloc<ImagePicEvent, ImagePicState> {
  ImagePicBloc() : super(ImagePicInitial()) {
    on<ImagePicEvent>((event, emit) {});
    on<SelectImage>((event, emit) async{
      File avatar = await imagePic();
      emit(ImageState(fileImage1:avatar));
    });
  }}

  Future<File> imagePic() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
        return File(image!.path);
  }