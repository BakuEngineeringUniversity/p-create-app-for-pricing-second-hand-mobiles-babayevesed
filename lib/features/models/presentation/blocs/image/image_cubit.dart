import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());
  addImage(List<XFile> files) {
    if (state is ImagesAdded) {
      emit(ImagesAdded([...(state as ImagesAdded).imageFiles, ...files]));
    } else {
      emit(ImagesAdded(files));
    }
  }
}
