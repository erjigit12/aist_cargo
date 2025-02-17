import 'package:aist_cargo/src/feature/auth/data/models/signup_reg_params.dart';
import 'package:aist_cargo/src/feature/auth/domain/repositories/user_repo.dart';
import 'package:dartz/dartz.dart';

class RegisterUsecase {
  RegisterUsecase({required this.userRepository});

  final UserRepository userRepository;

  Future<Either> call(SignupRegParams signupReg) async {
    return await userRepository.singUpUser(signupReg);
  }
}
