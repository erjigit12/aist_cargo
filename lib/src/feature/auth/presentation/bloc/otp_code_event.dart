part of 'otp_code_bloc.dart';

// BLoC Events
abstract class OtpEvent {}

class OtpSubmitted extends OtpEvent {
  final String otp;
  OtpSubmitted(this.otp);
}
