import 'dart:developer';
import 'dart:io';

import 'package:aist_cargo/injection_container.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  @override
  Future<Either> getUserData() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    var id = storage.getInt('id');

    try {
      final response = await sl<DioClient>().get(
        '${ApiConst.userProfile}/$id',
      );

      log('Маалымат келди: ${response.data}');

      return Right(response);
    } on DioException catch (e) {
      throw Exception(
          'Маалыматты алып келуудо ката кетти: ${e.response?.data ?? e.message}');
    }
  }

  @override
  Future<Either> updateUserData(UserModel userModel) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    var id = storage.getInt('id');

    try {
      final response = await sl<DioClient>().put(
        '${ApiConst.userUpdate}/$id',
        options: Options(
          headers: {
            'accept': '*/*',
            'Content-Type': 'application/json',
          },
        ),
        data: userModel.toJson(),
      );

      log('📩 Жөнөтүлгөн маалымат: ${userModel.toJson()}');
      log('📩 Сервердин жообу (data): ${response.data}');
      log('📩 Сервердин жообу (statusCode): ${response.statusCode}');

      return Right(response);
    } on DioException catch (e) {
      log('❌ Ката кетти: ${e.response?.data}');
      log('❌ Ката статус коду: ${e.response?.statusCode}');
      log('❌ Ката тексти: ${e.message}');

      return Left(Exception('Серверден ката жооп келди!'));
    }
  }

  @override
  Future<String> uploadImage(File imageFile) async {
    final fileSizeMB = imageFile.lengthSync() / (1024 * 1024);
    if (fileSizeMB > 10) {
      // Лимит Cloudinary обычно 10-20MB
      throw Exception('Файл слишком большой ($fileSizeMB MB). Максимум: 10MB');
    }
    try {
      // Сжимаем изображение
      final compressedFile = await compressImage(imageFile);
      log('Compressed size: ${compressedFile.lengthSync() ~/ 1024} KB');

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          compressedFile.path,
          filename: 'upload_${DateTime.now().millisecondsSinceEpoch}.jpg',
        ),
      });

      final response = await sl<DioClient>().post(
        ApiConst.cloudinaryUpload,
        data: formData,
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
          validateStatus: (status) => status! < 500,
        ),
      );

      if (response.statusCode == 413) {
        throw Exception('Слишком большой файл. Максимальный размер: 10MB');
      }
      return response.data['secure_url'];
    } catch (e) {
      log('Upload error: $e');
      rethrow;
    }
  }
}
