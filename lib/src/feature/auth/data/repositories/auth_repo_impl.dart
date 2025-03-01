import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.remoteAuthDataSource,
    required this.localAuthDataSource,
  });

  final RemoteAuthDataSource remoteAuthDataSource;
  final LocalAuthDataSource localAuthDataSource;

  @override
  Future<Either> signInUser(SigninRegParams signinReg) async {
    Either result = await remoteAuthDataSource.signInUser(signinReg);
    return result.fold(
      (l) {
        return Left(l);
      },
      (r) async {
        Response response = r;
        SharedPreferences storage = await SharedPreferences.getInstance();
        storage.setString('token', response.data['token']);
        // storage.setInt('id', response.data['id']);
        return Right(response);
      },
    );
  }

  @override
  Future<Either> signUpUser(SignupRegParams signupReg) async {
    Either result = await remoteAuthDataSource.signUpUser(signupReg);
    return result.fold(
      (l) {
        return Left(l);
      },
      (r) async {
        Response response = r;
        SharedPreferences storage = await SharedPreferences.getInstance();
        storage.setString('token', response.data['token']);
        // storage.setInt('id', response.data['id']);
        return Right(response);
      },
    );
  }

  @override
  Future<Either> verifyOtp({required String otp}) async =>
      remoteAuthDataSource.verifyOtp(otp: otp);

  @override
  Future<bool> isLoggedIn() async => localAuthDataSource.isLoggedIn();

  @override
  Future<Either> logOut() async => localAuthDataSource.logOut();
}
