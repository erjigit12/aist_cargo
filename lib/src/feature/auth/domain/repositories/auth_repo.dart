import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> signUpUser(SignupRegParams signupReg);
  Future<Either> signInUser(SigninRegParams signinReg);
  Future<Either> logOut();
  Future<bool> isLoggedIn();
}
