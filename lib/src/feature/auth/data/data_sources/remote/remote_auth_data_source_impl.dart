// ignore_for_file: deprecated_member_use

import 'package:aist_cargo/injection_container.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  RemoteAuthDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<Either> signInUser(SigninRegParams signinReg) async {
    try {
      final response = await sl<DioClient>().post(
        ApiConst.signIn,
        data: signinReg.toMap(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data);
      } else {
        throw Exception(
            'Failed to sign up. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      throw Exception('Failed to sign up: ${e.response?.data ?? e.message}');
    }
  }

  @override
  Future<Either> signUpUser(SignupRegParams signupReg) async {
    try {
      final response = await sl<DioClient>().post(
        ApiConst.signUp,
        data: signupReg.toMap(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data);
      } else {
        throw Exception(
            'Failed to sign up. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      throw Exception('Failed to sign up: ${e.response?.data ?? e.message}');
    }
  }

  @override
  Future<Either> verifyOtp({required String otp}) async {
    try {
      final response = await sl<DioClient>().post(
        ApiConst.verifyCode,
        data: {'code': otp},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data);
      } else {
        throw Exception(
            'Failed to verify otp. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      throw Exception('Failed to verify otp: ${e.response?.data ?? e.message}');
    }
  }
}
