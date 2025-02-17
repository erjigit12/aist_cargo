import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> singUpUser(SignupRegParams signupReg);
  Future<Either> signInUser(SigninRegParams signinReg);
}
