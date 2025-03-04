import 'dart:developer';

import 'package:aist_cargo/injection_container.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  @override
  Future<Either> getUserData() async {
    try {
      // SharedPreferences storage = await SharedPreferences.getInstance();
      // var token = storage.getString('token');
      final response = await sl<DioClient>().get(
        ApiConst.userProfile,
        // options: Options(
        //   headers: {
        //     'Authorization': 'Bearer $token',
        //   },
        // ),
      );

      log('Маалымат келди: ${response.data}');

      return Right(response);
    } on DioException catch (e) {
      throw Exception(
          'Failed to get user data: ${e.response?.data ?? e.message}');
    }
  }
}
