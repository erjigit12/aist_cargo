import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class CreateDeliveryUsecase {
  CreateDeliveryUsecase({required this.repository});

  final DeliveryRepository repository;

  Future<Either> call(CreateDeliveryModel delivery) async =>
      await repository.createDelivery(delivery);
}
