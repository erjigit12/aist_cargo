import 'dart:developer';

import 'package:aist_cargo/injection_container.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteDeliveryDataSourceImpl implements RemoteDeliveryDataSource {
  @override
  Future<Either> createDelivery(CreateDeliveryModel delivery) async {
    try {
      SharedPreferences storage = await SharedPreferences.getInstance();
      var accessToken = storage.getString('accessToken');

      final response = await sl<DioClient>().post(
        ApiConst.createDelivery,
        data: delivery.toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );

      log('📩 Сервердин жообу (data): ${response.data}');
      log('📩 Сервердин жообу (statusCode): ${response.statusCode}');

      return Right(response);
    } on DioException catch (e) {
      throw Exception(
          'Failed to create delivery: ${e.response?.data ?? e.message}');
    }
  }
}
