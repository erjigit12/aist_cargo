import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.remoteAuthDataSource});

  final RemoteAuthDataSource remoteAuthDataSource;

  @override
  Future<Either> signInUser(SigninRegParams signinReg) async =>
      remoteAuthDataSource.signInUser(signinReg);

  @override
  Future<Either> singUpUser(SignupRegParams signupReg) async =>
      remoteAuthDataSource.singUpUser(signupReg);
}
