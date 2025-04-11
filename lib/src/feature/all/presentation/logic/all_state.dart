part of 'all_cubit.dart';

sealed class AllState extends Equatable {
  const AllState();

  @override
  List<Object> get props => [];
}

final class AllInitial extends AllState {}

final class DeliveryLoading extends AllState {}

final class DeliveryLoaded extends AllState {
  final DeliveryEntity delivery;

  const DeliveryLoaded(this.delivery);

  @override
  List<Object> get props => [delivery];
}

final class DeliveryError extends AllState {
  final String message;

  const DeliveryError(this.message);

  @override
  List<Object> get props => [message];
}
