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
        data: delivery.toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );

      log("📤 Жиберилип жаткан маалымат: ${jsonEncode(delivery.toJson())}");

      // 🔥 Жооп JSON форматка айлана алабы, текшерүү
      try {
        var jsonResponse = jsonDecode(response.data.toString());
        log('📩 Сервердин жообу (JSON): $jsonResponse');
      } catch (jsonError) {
        log('🚨 Сервердин жообун JSON кылып окуй алган жокмун: ${response.data}');
        throw Exception(
            "Server response is not a valid JSON: ${response.data}");
      }

      log("🚨 Серверден келген түпнуска жооп: ${response.toString()}");

      return Right(response);
    } on DioException catch (e) {
      log('❌ Сервер ката берди: ${e.response?.data ?? e.message}');
      throw Exception('Failed to create delivery: ${e.response}');
    } catch (e) {
      log('❌ Жалпы ката: $e');
      throw Exception('Unexpected error: $e');
    }
  }
}
