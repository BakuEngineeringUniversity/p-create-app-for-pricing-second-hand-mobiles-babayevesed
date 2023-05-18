part of 'image_cubit.dart';

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}

class ImagesAdded extends ImageState {
  final List<XFile> imageFiles;
  const ImagesAdded(this.imageFiles);
  @override
  List<Object> get props => [imageFiles];
}
