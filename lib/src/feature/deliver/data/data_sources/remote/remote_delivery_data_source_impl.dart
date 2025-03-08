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
  Future<Either> createDelivery(String fromWhere, String toWhere,
      String dispatchDate, String arrivalDate, String description) async {
    try {
      SharedPreferences storage = await SharedPreferences.getInstance();
      var accessToken = storage.getString('accessToken');

      log("✅ Access Token: $accessToken");

      final response = await sl<DioClient>().post(
        ApiConst.createDelivery,
        data: {
          'fromWhere': fromWhere,
          'toWhere': toWhere,
          'dispatchDate': dispatchDate,
          'arrivalDate': arrivalDate,
          'description': description,
          'fullName': 'Asan Sulaimanov',
          'transportNumber': "AC202F",
          'transportType': "AIRPLANE",
          'packageType': "LUGGAGE",
          'truckSize': "SMALL",
          'size': "S",
          'role': "DELIVERY",
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        ),
      );

      log("📤 Жиберилип жаткан маалымат: ${jsonEncode(response.data)}");

      if (response.statusCode == 200 || response.statusCode == 201) {
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
      }

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
