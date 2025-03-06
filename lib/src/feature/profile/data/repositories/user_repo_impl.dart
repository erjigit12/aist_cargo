import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.remoteUserDataSource});

  final RemoteUserDataSource remoteUserDataSource;

  @override
  Future<Either> getUserData(int id) async {
    Either result = await remoteUserDataSource.getUserData(id);
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

      var userModel = UserModel.fromMap(response.data);
      var userEntity = userModel.toEntity();

      return Right(userEntity);
    });
  }
}
