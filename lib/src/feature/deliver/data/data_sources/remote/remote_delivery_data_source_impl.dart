import 'dart:convert';
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

      log("✅ Access Token: $accessToken");

      final response = await sl<DioClient>().post(
        ApiConst.createDelivery,
        options: Options(
          headers: {
            'accept': ' */*',
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        ),
        data: delivery.toJson(),
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

      final createdDelivery = CreateDeliveryModel.fromJson(response.data);

      return Right(createdDelivery);
    } on DioException catch (e) {
      log('❌ Сервер ката берди: ${e.response ?? e.message}');
      throw Exception('Failed to create delivery: ${e.response}');
    } catch (e) {
      log('❌ Жалпы ката: $e');
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<Either> createSubscription(
      CreateSubscriptionModel subscription) async {
    try {
      SharedPreferences storage = await SharedPreferences.getInstance();
      var accessToken = storage.getString('accessToken');

      log("✅ Access Token: $accessToken");

      final response = await sl<DioClient>().post(
        ApiConst.createSubscription,
        options: Options(
          headers: {
            'accept': ' */*',
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        ),
        data: subscription.toJson(),
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

      return Right(response.data);
    } on DioException catch (e) {
      log('❌ Сервер ката берди: ${e.response ?? e.message}');
      throw Exception('Failed to create subscription: ${e.response}');
    }
  }
}
