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
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path),
      });

      final response = await sl<DioClient>().post(
        ApiConst.cloudinaryUpload,
        data: formData,
      );

      log('Cloudinary жообу: ${response.data}');
      return response.data['url'];
    } catch (e) {
      log('Фото жүктөө катасы: $e');
      rethrow;
    }
  }
}
