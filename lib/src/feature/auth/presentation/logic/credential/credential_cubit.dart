import 'package:aist_cargo/src/feature/auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SigninUsecase signinUsecase;
  final SignupUsecase signupUsecase;

  CredentialCubit({
    required this.signinUsecase,
    required this.signupUsecase,
  }) : super(CredentialInitial());

  void signUp(SignupRegParams signupReg) async {
    emit(CredentialLoading());
    try {
      Either result = await signupUsecase(signupReg);
      result.fold((l) {
        emit(CredentialFailure(errorMessage: l));
      }, (r) {
        emit(CredentialSuccess());
      });
    } catch (e) {
      emit(CredentialFailure(errorMessage: e.toString()));
    }
  }

  void signIn(SigninRegParams signinReg) async {
    emit(CredentialLoading());
    try {
      Either result = await signinUsecase(signinReg);
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
