import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class CreateSubscriptionUsecase {
  CreateSubscriptionUsecase({required this.repository});

  final DeliveryRepository repository;

  Future<Either> call(CreateSubscriptionModel subscription) async =>
      await repository.createSubscription(subscription);
}
