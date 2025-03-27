part of 'send_cubit.dart';

sealed class SendState extends Equatable {
  const SendState();

  @override
  List<Object> get props => [];
}

final class SendInitial extends SendState {}

final class SendLoading extends SendState {}

final class SendSuccess extends SendState {
  const SendSuccess({required this.send, this.orderNumber});

  final Map<String, dynamic> send;
  final int? orderNumber;
  @override
  List<Object> get props => [send, orderNumber ?? 0];
}

final class SendFailure extends SendState {
  const SendFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
