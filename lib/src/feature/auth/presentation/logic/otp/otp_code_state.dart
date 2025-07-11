part of 'otp_code_bloc.dart';

// BLoC State
abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {}

class OtpFailure extends OtpState {
  final String error;
  OtpFailure(this.error);
}
