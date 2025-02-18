import 'package:aist_cargo/src/feature/auth/data/models/signup_reg_params.dart';
import 'package:aist_cargo/src/feature/auth/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';

class SignupUsecase {
  SignupUsecase({required this.authRepository});

  final AuthRepository authRepository;

  Future<Either> call(SignupRegParams signupReg) async {
    return await authRepository.signUpUser(signupReg);
  }
}
