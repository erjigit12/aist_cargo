import 'package:aist_cargo/src/feature/feature.dart';

class GetDeliveryByIdUsecase {
  final AllRepo repository;

  GetDeliveryByIdUsecase({required this.repository});

  Future<DeliveryEntity> call(int id) {
    return repository.getDeliveryById(id);
  }
}
