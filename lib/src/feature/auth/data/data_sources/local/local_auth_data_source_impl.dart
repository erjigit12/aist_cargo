import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class LocalAuthDataSourceImpl implements LocalAuthDataSource {
  @override
  Future<bool> isLoggedIn() async {
    throw UnimplementedError();
  }

  @override
  Future<Either> logOut() async {
    throw UnimplementedError();
  }
}
