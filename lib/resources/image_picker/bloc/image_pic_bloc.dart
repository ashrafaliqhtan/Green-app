import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/locators/data_injection.dart';
import 'package:green_saudi_app/resources/image_picker/image_picker.dart';
import 'package:green_saudi_app/service/supabase_services.dart';

part 'image_pic_event.dart';
part 'image_pic_state.dart';

class ImagePicBloc extends Bloc<ImagePicEvent, ImagePicState> {
  final serviceLocator = DataInjection().locator.get<DBServices>();

  ImagePicBloc() : super(ImagePicInitial()) {
    on<ImagePicEvent>((event, emit) {});

  on<UpdateImageToDatabase>((event, emit) {
      GetIt.I.get<DBServices>().deleteImage(event.bucketName,event.fileName);
      GetIt.I.get<DBServices>().uploadImage(GetIt.I.get<DBServices>().ImageFileFromDatabase,event.bucketName,event.fileName);
      //emit(ImageState(fileImage:GetIt.I.get<DBServices>().ImageFileFromDatabase));
},);
    on<SelectImage>((event, emit) async{
      File avatar1 = await imagePic();
      GetIt.I.get<DBServices>().ImageFileFromDatabase=avatar1;
      emit(ImageState(fileImage:avatar1));
    });
  }
}


