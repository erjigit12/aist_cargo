import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class LogoutUsecase {
  final AuthRepository authRepository;

  LogoutUsecase({required this.authRepository});

  Future<Either> call() async {
    return await authRepository.logOut();
  }
}
