import 'package:aist_cargo/src/feature/auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SigninUsecase signinUsecase;
  final SignupUsecase signupUsecase;

  CredentialCubit({
    required this.signinUsecase,
    required this.signupUsecase,
  }) : super(CredentialInitial());
}
