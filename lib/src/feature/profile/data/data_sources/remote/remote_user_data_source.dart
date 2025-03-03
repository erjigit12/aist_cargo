import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteUserDataSource {
  Future<Either> getUserData(UserModel user);
}
