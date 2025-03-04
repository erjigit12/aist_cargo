import 'package:dartz/dartz.dart';

abstract class RemoteUserDataSource {
  Future<Either> getUserData();
}
