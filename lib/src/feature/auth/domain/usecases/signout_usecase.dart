import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class SignoutUsecase {
  final AuthRepository authRepository;

  SignoutUsecase({required this.authRepository});

  Future<Either> call() async {
    return await authRepository.signOut();
  }
}
