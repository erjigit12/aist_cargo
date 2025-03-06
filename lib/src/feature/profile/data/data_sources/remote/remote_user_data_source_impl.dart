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
        '${ApiConst.userUpdate}/${14}',
        queryParameters: {'id': 14},
        data: userModel.toMap(),
      );

      log('Маалымат келди: ${response.data}');

      return Right(response);
    } on DioException catch (e) {
      throw Exception('ката чыкты: $e');
    }
  }
}
