import 'dart:io';

import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteUserDataSource {
  Future<Either> getUserData();
  Future<Either> updateUserData(UserModel userModel);
  Future<String> uploadImage(File imageFile);
}
