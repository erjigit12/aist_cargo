part of 'delivery_cubit.dart';

sealed class DeliveryState extends Equatable {
  const DeliveryState();

  @override
  List<Object> get props => [];
}

final class DeliveryInitial extends DeliveryState {}

final class DeliveryLoading extends DeliveryState {}

final class DeliverySuccess extends DeliveryState {
  const DeliverySuccess({required this.deliveries});

  final Map<String, dynamic> deliveries;
}

final class DeliveryFailure extends DeliveryState {
  const DeliveryFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class DeliveryUpdated extends DeliveryState {}
