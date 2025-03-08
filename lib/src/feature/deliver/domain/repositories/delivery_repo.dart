import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

abstract class DeliveryRepository {
  Future<Either> createDelivery(
    String fromWhere,
    String toWhere,
    String dispatchDate,
    String arrivalDate,
    String description,
  );
}
