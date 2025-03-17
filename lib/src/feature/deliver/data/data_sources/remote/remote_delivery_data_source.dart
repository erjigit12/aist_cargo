import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteDeliveryDataSource {
  Future<Either> createDelivery(CreateDeliveryModel delivery);

  Future<Either> createSubscription(String duration, String transportType);
}
