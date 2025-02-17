import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.remoteUserDataSource});

  final RemoteUserDataSource remoteUserDataSource;

  @override
  Future<Either> signInUser(SigninRegParams signinReg) async =>
      remoteUserDataSource.signInUser(signinReg);

  @override
  Future<Either> singUpUser(SignupRegParams signupReg) async =>
      remoteUserDataSource.singUpUser(signupReg);
}
