import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class GetUserDataUsecase {
  GetUserDataUsecase(this.repository);

  final UserRepo repository;

  Future<Either> call(UserModel user) async {
    return await repository.getUserData(user);
  }
}
