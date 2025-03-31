import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:dartz/dartz.dart';

class PickImageUsecase {
  final ImagePicker picker;

  PickImageUsecase({required this.picker});

  /// Выбирает изображение из указанного источника (галерея или камера)
  /// Возвращает [Result] с [File] в случае успеха или ошибкой в случае неудачи
  Future<Either<String, File>> call(ImageSource source) async {
    try {
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        return right(File(image.path));
      }
      return left('No image selected');
    } catch (e) {
      return left(e.toString());
    }
  }
}
