part of 'image_pic_bloc.dart';

@immutable
sealed class ImagePicState {}

final class ImagePicInitial extends ImagePicState {}


final class ImageState extends ImagePicState {
 final File fileImage;
 ImageState({required this.fileImage});
}
