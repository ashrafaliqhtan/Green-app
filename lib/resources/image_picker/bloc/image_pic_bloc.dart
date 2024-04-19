import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_saudi_app/locators/data_injection.dart';
import 'package:green_saudi_app/resources/image_picker/image_picker.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'image_pic_event.dart';
part 'image_pic_state.dart';

class ImagePicBloc extends Bloc<ImagePicEvent, ImagePicState> {
  final serviceLocator = DataInjection().locator.get<DBServices>();

  ImagePicBloc() : super(ImagePicInitial()) {
    on<ImagePicEvent>((event, emit) {});

    on<SelectImage>((event, emit) async {
      serviceLocator.userImageFile = await imagePic();
      emit(ImageState(fileImage1: serviceLocator.userImageFile));
      try {
        await serviceLocator.uploadImage(serviceLocator.userImageFile);
        emit(ImageState(fileImage1: serviceLocator.userImageFile));
      } on StorageException catch (_) {
        await serviceLocator.updateImage(serviceLocator.userImageFile);
        emit(ImageState(fileImage1: serviceLocator.userImageFile));
      } catch (e) {
        print(e);
      }
    });
  }
}
