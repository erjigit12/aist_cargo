import 'package:aist_cargo/src/feature/feature.dart';

abstract class RemoteDeliveryDataSource {
  Future<void> createDelivery(CreateDeliveryModel delivery);
}
