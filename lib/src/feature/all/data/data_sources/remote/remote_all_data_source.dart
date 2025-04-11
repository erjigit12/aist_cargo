import 'package:aist_cargo/src/feature/feature.dart';

abstract class RemoteAllDataSource {
  Future<DeliveryEntity> getDeliveryById(int id);
}
