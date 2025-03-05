import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class UpdateUserDataUsecase {
  UpdateUserDataUsecase({required this.repository});

  final UserRepository repository;

  Future<Either> call(UserModel userModel) async {
    return await repository.updateUserData(userModel);
  }
}
