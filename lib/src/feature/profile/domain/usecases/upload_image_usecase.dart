import 'dart:io';

import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class UploadImageUsecase {
  final UserRepository repository;

  UploadImageUsecase({required this.repository});

  Future<Either<String, String>> call(File imageFile) async {
    return await repository.uploadImage(imageFile);
  }
}
