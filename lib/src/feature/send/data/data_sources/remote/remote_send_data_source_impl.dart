import 'dart:developer';

import 'package:aist_cargo/injection_container.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteSendDataSourceImpl implements RemoteSendDataSource {
  @override
  Future<Either> createSend(SendModel sendModel) async {
    try {
      SharedPreferences storage = await SharedPreferences.getInstance();
      var accessToken = storage.getString('accessToken');

      log("✅ Access Token: $accessToken");

      final response = await sl<DioClient>().post(
        ApiConst.createSendings,
        options: Options(
          headers: {
            'accept': ' */*',
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        ),
        data: sendModel.toJson(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      log('❌ Сервер ката берди: ${e.response ?? e.message}');
      throw Exception('Failed to create delivery: ${e.response}');
    } catch (e) {
      log('❌ Жалпы ката: $e');
      throw Exception('Unexpected error: $e');
    }
  }
}
