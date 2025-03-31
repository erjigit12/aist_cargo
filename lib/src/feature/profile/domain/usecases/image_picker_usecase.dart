import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PickImageUsecase {
  final ImagePicker picker;

  PickImageUsecase({required this.picker});

  /// Выбирает изображение из указанного источника (галерея или камера)
  /// Возвращает [Result] с [File] в случае успеха или ошибкой в случае неудачи
  Future<Result<File>> call(ImageSource source) async {
    try {
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        return Success(File(image.path));
      }
      return Failure('No image selected');
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
