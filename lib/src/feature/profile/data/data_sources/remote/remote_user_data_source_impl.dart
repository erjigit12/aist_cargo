import 'dart:developer';

import 'package:aist_cargo/injection_container.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  @override
  Future<Either> getUserData(int id) async {
    try {
      final response = await sl<DioClient>().get(
        '${ApiConst.userProfile}/$id',
      );

      log('Маалымат келди: ${response.data}');

      return Right(response);
    } on DioException catch (e) {
      throw Exception(
          'Failed to get user data: ${e.response?.data ?? e.message}');
    }
  }

  @override
  Future<Either> updateUserData(UserModel userModel) async {
    try {
      final response = await sl<DioClient>().put(
        '${ApiConst.userUpdate}/${userModel.id}',
        data: userModel.toMap(),
      );

      log('📩 Жөнөтүлгөн маалымат: ${userModel.toMap()}');
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
}
