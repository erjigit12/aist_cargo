import 'package:aist_cargo/src/feature/auth/auth.dart';

class IslLoggedInUsecase {
  final AuthRepository authRepository;

  IslLoggedInUsecase({required this.authRepository});

  Future<bool> call() async {
    return await authRepository.isLoggedIn();
  }
}
