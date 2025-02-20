import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class OtpUsecase {
  final AuthRepository authRepository;

  OtpUsecase({required this.authRepository});

  Future<Either> call(String otp) async {
    return await authRepository.verifyOtp(otp: otp);
  }
}
