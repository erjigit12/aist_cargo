import 'package:aist_cargo/src/feature/feature.dart';

abstract class DeliveryRepository {
  Future<void> createDelivery(CreateDeliveryModel delivery);
}
