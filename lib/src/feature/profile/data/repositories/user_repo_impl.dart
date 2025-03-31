import 'dart:developer';
import 'dart:io';

import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.remoteUserDataSource});

  final RemoteUserDataSource remoteUserDataSource;

  @override
  Future<Either> getUserData() async {
    Either result = await remoteUserDataSource.getUserData();
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      Response response = r;

      var userModel = UserModel.fromMap(response.data);
      var userEntity = userModel.toEntity();

      return Right(userEntity);
    });
  }

  @override
  Future<Either> updateUserData(UserModel userModel) async {
    Either result = await remoteUserDataSource.updateUserData(userModel);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      Response response = r;

      log('Серверден келген жооп: ${response.data}');

      try {
        var userModel = UserModel.fromMap(response.data);
        var userEntity = userModel.toEntity();
        return Right(userEntity);
      } catch (e) {
        log('JSON парсингинде ката кетти: $e');
        return Left(Exception('Маалыматты иштетүүдө ката кетти.'));
      }
    });
  }

  @override
  Future<Either<String, String>> uploadImage(File imageFile) async {
    try {
      final url = await remoteUserDataSource.uploadImage(imageFile);
      return Right(url);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
