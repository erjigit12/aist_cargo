import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aist_cargo/injection_container.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RemoteSendDataSourceImpl implements RemoteSendDataSource {
  @override
  Future<Either> isSubscribed(CreateDeliveryModel sendModel) async {
    try {
      SharedPreferences storage = await SharedPreferences.getInstance();
      var accessToken = storage.getString('accessToken');
      var id = storage.getInt('id');

      log("✅ Access Token: $accessToken");
      log("✅ ID: $id");

      final response = await sl<DioClient>().post(
        '${ApiConst.isSubscription}/sendings/createTrue',
        options: Options(
          headers: {
            'accept': '*/*',
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        ),
        data: sendModel.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          var jsonResponse = jsonEncode(response.data);
          log('📩 Сервердин жообу (JSON): $jsonResponse');
        } catch (jsonError) {
          log('🚨 Сервердин жообун JSON кылып окуй алган жокмун: ${response.statusCode}');
          throw Exception(
              "Server response is not a valid JSON: ${response.data}");
        }
      }

      final createSend = CreateDeliveryModel.fromJson(response.data);

      return Right(createSend);
    } on DioException catch (e) {
      log('❌ Сервер ката берди: ${e.response ?? e.message}');
      throw Exception('Failed to create send: ${e.response}');
    } catch (e) {
      log('❌ Жалпы ката: $e');
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<Either<String, CreateDeliveryModel>> createSend(
      CreateDeliveryModel send) async {
    try {
      SharedPreferences storage = await SharedPreferences.getInstance();
      var accessToken = storage.getString('accessToken');

      log("✅ Access Token: $accessToken");

      final response = await sl<DioClient>().post(
        ApiConst.createSendings,
        options: Options(
          headers: {
            'accept': '*/*',
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        ),
        data: send.toJson(),
      );

      log('📩 Сервердин жообу: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          final createdDelivery = CreateDeliveryModel.fromJson(responseData);
          return Right(createdDelivery);
        } else {
          return const Left("Неверный формат ответа сервера");
        }
      } else {
        return const Left("Ошибка сервера");
      }
    } on DioException catch (e) {
      log('❌ Dio ката: ${e.response?.data ?? e.message}');
      return Left(e.response?.data?['message'] ?? 'Ошибка сети');
    } catch (e) {
      log('❌ Жалпы ката: $e');
      return Left('Неожиданная ошибка: $e');
    }
  }
}
