import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';
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
        Map<String, dynamic> response = r;

        SharedPreferences storage = await SharedPreferences.getInstance();
        storage.setString('accessToken', response['token']);
        storage.setInt('id', response['id']);
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
        Map<String, dynamic> response = r;

        SharedPreferences storage = await SharedPreferences.getInstance();
        storage.setString('accessToken', response['token']);
        storage.setInt('id', response['id']);
        return Right(response);
      },
    );
  }

  @override
  Future<Either> verifyOtp({required String otp}) async {
    Either result = await remoteAuthDataSource.verifyOtp(otp: otp);
    return result.fold(
      (l) {
        return Left(l);
      },
      (r) async {
        Map<String, dynamic> response = r;

        SharedPreferences storage = await SharedPreferences.getInstance();
        storage.setInt('id', response['id']);

        return Right(response);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async => await localAuthDataSource.isLoggedIn();

  @override
  Future<Either> logOut() async => await localAuthDataSource.logOut();
}
