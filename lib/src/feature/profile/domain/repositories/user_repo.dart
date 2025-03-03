import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepo {
  Future<Either> getUserData(UserModel user);
}
