import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class CreateDeliveryUsecase {
  CreateDeliveryUsecase({required this.repository});

  final DeliveryRepository repository;

  Future<Either> call(
    String fromWhere,
    String toWhere,
    String dispatchDate,
    String arrivalDate,
    String description,
  ) async =>
      await repository.createDelivery(
        fromWhere,
        toWhere,
        dispatchDate,
        arrivalDate,
        description,
      );
}
