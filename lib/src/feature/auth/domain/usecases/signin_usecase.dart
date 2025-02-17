import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  LoginUsecase({required this.authRepository});

  final AuthRepository authRepository;

  Future<Either> call(SigninRegParams signinReg) async {
    return await authRepository.signInUser(signinReg);
  }
}
