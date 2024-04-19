import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/image_picker/image_pic.dart';
import 'package:green_saudi_app/service/supabase_services.dart';

part 'image_pic_event.dart';
part 'image_pic_state.dart';

class ImagePicBloc extends Bloc<ImagePicEvent, ImagePicState> {
  ImagePicBloc() : super(ImagePicInitial()) {
    on<ImagePicEvent>((event, emit) {});
on<UpdateImageToDatabase>((event, emit) {
      GetIt.I.get<DBServices>().deleteImage();
      GetIt.I.get<DBServices>().uploadImage(GetIt.I.get<DBServices>().userImageFile);
      emit(ImageState(fileImage:GetIt.I.get<DBServices>().userImageFile));
},);
    on<SelectImage>((event, emit) async{
      File avatar = await imagePic();
      GetIt.I.get<DBServices>().userImageFile=avatar;
      emit(ImageState(fileImage:avatar));
    });
  }}
