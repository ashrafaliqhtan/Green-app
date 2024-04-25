import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_saudi_app/locators/data_injection.dart';
import 'package:green_saudi_app/resources/image_picker/image_picker.dart';
import 'package:green_saudi_app/service/supabase/supabase_services.dart';

part 'image_pic_event.dart';
part 'image_pic_state.dart';

class ImagePicBloc extends Bloc<ImagePicEvent, ImagePicState> {
  final serviceLocator = DataInjection().locator.get<DBServices>();

  ImagePicBloc() : super(ImagePicInitial()) {
    on<ImagePicEvent>((event, emit) {});

    on<UpdateImageToDatabase>(
      (event, emit) {
        if (serviceLocator.ImageFileFromDatabase.path.trim().isNotEmpty) {
          try {
            serviceLocator.deleteImage(event.bucketName, event.fileName);
            serviceLocator.uploadImage(serviceLocator.ImageFileFromDatabase,
                event.bucketName, event.fileName);
          } catch (_) {}
        }
      },
    );
    on<SelectImage>((event, emit) async {
      try {
        File avatar1 = await imagePic();
        serviceLocator.ImageFileFromDatabase = avatar1;
        emit(ImageState(fileImage: avatar1));
      } catch (_) {}
    });
  }
}
