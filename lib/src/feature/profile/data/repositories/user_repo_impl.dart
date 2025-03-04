import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.remoteUserDataSource});

  final RemoteUserDataSource remoteUserDataSource;

  @override
  Future<Either> getUserData() async {
    return await remoteUserDataSource.getUserData();
  }
}
