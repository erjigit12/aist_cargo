import 'package:bloc/bloc.dart';
part 'otp_code_event.dart';
part 'otp_code_state.dart';

// BLoC Implementation
class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<OtpSubmitted>(_onOtpSubmitted);
  }

  void _onOtpSubmitted(OtpSubmitted event, Emitter<OtpState> emit) async {
    emit(OtpLoading());
    await Future.delayed(const Duration(seconds: 2));

    if (event.otp == '9627') {
      emit(OtpSuccess());
    } else {
      emit(OtpFailure("Неверный код. Попробуйте снова."));
    }
  }
}
