part of 'all_cubit.dart';

sealed class AllState extends Equatable {
  const AllState();

  @override
  List<Object> get props => [];
}

final class AllInitial extends AllState {}

final class DeliveryLoadin extends AllState {}

final class DeliveryLoaded extends AllState {
  final DeliveryEntity? delivery;

  const DeliveryLoaded({this.delivery});

  @override
  List<Object> get props => [delivery ?? []];
}

final class SendLoaded extends AllState {
  final SendEntity? send;

  const SendLoaded({required this.send});

  @override
  List<Object> get props => [send ?? []];
}

final class DeliveryError extends AllState {
  final String message;

  const DeliveryError(this.message);

  @override
  List<Object> get props => [message];
}
