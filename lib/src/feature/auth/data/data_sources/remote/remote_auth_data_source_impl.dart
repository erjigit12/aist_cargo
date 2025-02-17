import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  @override
  Future<Either> signInUser(SigninRegParams signinReg) async {
    throw UnimplementedError();
  }

  @override
  Future<Either> singUpUser(SignupRegParams signupReg) async {
    throw UnimplementedError();
  }
}
