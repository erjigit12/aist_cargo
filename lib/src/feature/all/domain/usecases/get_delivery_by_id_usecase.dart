import 'package:aist_cargo/src/feature/feature.dart';

class GetDeliveryByIdUsecase {
  final AllRepo repo;

  GetDeliveryByIdUsecase({required this.repo});

  Future<DeliveryEntity> call(int id) {
    return repo.getDeliveryById(id);
  }
}
