import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteUserDataSource {
  Future<Either> getUserData(int id);
  Future<Either> updateUserData(UserModel userModel);
}
