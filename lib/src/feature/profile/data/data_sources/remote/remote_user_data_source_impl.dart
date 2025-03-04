import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  @override
  Future<Either> getUserData(UserModel user) async {
    return Right(user);
  }
}
