import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

abstract class DeliveryRepository {
  Future<Either> isSubscribed(CreateDeliveryModel delivery);

  Future<Either<String, CreateDeliveryModel>> createDelivery(
      CreateDeliveryModel delivery);

  Future<Either> createSubscription(String duration, String transportType);
}
