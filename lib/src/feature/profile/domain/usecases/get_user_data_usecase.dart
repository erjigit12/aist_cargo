import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class GetUserDataUsecase {
  GetUserDataUsecase({required this.repository});

  final UserRepository repository;

  Future<Either> call() async {
    return await repository.getUserData();
  }
}
