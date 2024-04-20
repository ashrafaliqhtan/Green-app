part of 'image_pic_bloc.dart';

@immutable
sealed class ImagePicEvent {}

class SelectImage extends ImagePicEvent {}

class UpdateImageToDatabase extends ImagePicEvent{
  final String bucketName;
  final String fileName;

  UpdateImageToDatabase(this.bucketName,this.fileName);}