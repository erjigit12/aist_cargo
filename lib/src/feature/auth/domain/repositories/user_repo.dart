import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either> register(SignupRegParams signupReg);
  Future<Either> login(UserEntity userEntity);
}
