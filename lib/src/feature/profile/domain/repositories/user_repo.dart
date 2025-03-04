import 'package:dartz/dartz.dart';

abstract class UserRepo {
  Future<Either> getUserData();
}
