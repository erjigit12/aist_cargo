import 'package:aist_cargo/src/feature/auth/domain/repositories/user_repo.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  LoginUsecase({required this.userRepository});

  final UserRepository userRepository;

  Future<Either> call(SigninRegParams signinReg) async {
    return await userRepository.signInUser(signinReg);
  }
}
