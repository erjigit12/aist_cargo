part of 'send_cubit.dart';

sealed class SendState extends Equatable {
  const SendState();

  @override
  List<Object> get props => [];
}

final class SendInitial extends SendState {}

final class SendLoading extends SendState {}

final class SendSuccess extends SendState {
  const SendSuccess({required this.send});

  final Map<String, dynamic> send;

  @override
  List<Object> get props => [send];
}

final class SendFailure extends SendState {
  const SendFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
