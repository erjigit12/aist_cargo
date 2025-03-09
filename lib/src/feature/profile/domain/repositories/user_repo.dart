import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either> getUserData();
  Future<Either> updateUserData(UserModel userModel);
}
