import 'package:aist_cargo/src/feature/auth/auth.dart';

class IsLoggedInUsecase {
  final AuthRepository authRepository;

  IsLoggedInUsecase({required this.authRepository});

  Future<bool> call() async {
    return await authRepository.isLoggedIn();
  }
}
