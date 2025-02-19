import 'package:dartz/dartz.dart';

abstract class LocalAuthDataSource {
  Future<bool> isLoggedIn();
  Future<Either> logOut();
}
