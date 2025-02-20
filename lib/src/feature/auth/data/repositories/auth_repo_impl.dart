import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.remoteAuthDataSource,
    required this.localAuthDataSource,
  });

  final RemoteAuthDataSource remoteAuthDataSource;
  final LocalAuthDataSource localAuthDataSource;

  @override
  Future<Either> signInUser(SigninRegParams signinReg) async =>
      remoteAuthDataSource.signInUser(signinReg);

  @override
  Future<Either> signUpUser(SignupRegParams signupReg) async =>
      remoteAuthDataSource.signUpUser(signupReg);

  @override
  Future<Either> verifyOtp({required String otp}) async =>
      remoteAuthDataSource.verifyOtp(otp: otp);

  @override
  Future<bool> isLoggedIn() async => localAuthDataSource.isLoggedIn();

  @override
  Future<Either> logOut() async => localAuthDataSource.logOut();
}
