import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class IsSubscribedUsecase {
  IsSubscribedUsecase({required this.repository});

  final DeliveryRepository repository;

  Future<Either> call(CreateDeliveryModel delivery) async =>
      await repository.isSubscribed(delivery);
}
