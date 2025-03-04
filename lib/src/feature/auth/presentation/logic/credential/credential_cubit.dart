import 'package:aist_cargo/src/feature/auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SigninUsecase signinUsecase;
  final SignupUsecase signupUsecase;
  final OtpUsecase otpUsecase;
  final LogoutUsecase logoutUsecase;

  CredentialCubit({
    required this.signinUsecase,
    required this.signupUsecase,
    required this.otpUsecase,
    required this.logoutUsecase,
  }) : super(CredentialInitial());

  void signUp(SignupRegParams signupReg) async {
    emit(CredentialLoading());
    try {
      Either result = await signupUsecase.call(signupReg);
      result.fold(
        (l) {
          emit(CredentialFailure(errorMessage: l));
        },
        (r) {
          emit(CredentialSuccess());
        },
      );
    } catch (e) {
      emit(CredentialFailure(errorMessage: e.toString()));
    }
  }

  void signIn(SigninRegParams signinReg) async {
    emit(CredentialLoading());
    try {
      Either result = await signinUsecase.call(signinReg);
      result.fold(
        (l) {
          emit(CredentialFailure(errorMessage: l));
        },
        (r) {
          emit(CredentialSuccess());
        },
      );
    } catch (e) {
      emit(CredentialFailure(errorMessage: e.toString()));
    }
  }

  void verifyOtp(String otp) async {
    emit(CredentialLoading());
    try {
      Either result = await otpUsecase.call(otp);
      result.fold(
        (l) {
          emit(CredentialFailure(errorMessage: l));
        },
        (r) {
          emit(CredentialSuccess());
        },
      );
    } catch (e) {
      emit(CredentialFailure(errorMessage: e.toString()));
    }
  }

  void logout() async {
    emit(CredentialLoading());
    try {
      Either result = await logoutUsecase.call();
      result.fold((l) {
        emit(CredentialFailure(errorMessage: l));
      }, (r) {
        emit(CredentialSuccess());
      });
    } catch (e) {
      emit(CredentialFailure(errorMessage: e.toString()));
    }
  }
}
