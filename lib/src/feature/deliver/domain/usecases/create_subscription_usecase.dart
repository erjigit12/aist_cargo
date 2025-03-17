import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class CreateSubscriptionUsecase {
  CreateSubscriptionUsecase({required this.repository});

  final DeliveryRepository repository;

  Future<Either> call(String duration, String transportType) async =>
      await repository.createSubscription(duration, transportType);
}
