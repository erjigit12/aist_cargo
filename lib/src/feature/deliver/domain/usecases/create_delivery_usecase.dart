import 'package:aist_cargo/src/feature/feature.dart';

class CreateDeliveryUsecase {
  CreateDeliveryUsecase({required this.repository});

  final DeliveryRepository repository;

  Future<void> call(CreateDeliveryModel delivery) async =>
      await repository.createDelivery(delivery);
}
