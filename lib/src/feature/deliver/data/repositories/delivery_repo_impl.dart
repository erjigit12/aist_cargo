import 'package:aist_cargo/src/feature/feature.dart';

class DeliveryRepositoryImpl implements DeliveryRepository {
  DeliveryRepositoryImpl({required this.remoteDeliveryDataSource});

  final RemoteDeliveryDataSource remoteDeliveryDataSource;

  @override
  Future<void> createDelivery(CreateDeliveryModel delivery) async {
    return await remoteDeliveryDataSource.createDelivery(delivery);
  }
}
