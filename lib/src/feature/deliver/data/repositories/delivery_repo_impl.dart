import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class DeliveryRepositoryImpl implements DeliveryRepository {
  DeliveryRepositoryImpl({required this.remoteDeliveryDataSource});

  final RemoteDeliveryDataSource remoteDeliveryDataSource;

  @override
  Future<Either> isSubscribed(CreateDeliveryModel delivery) async {
    Either result = await remoteDeliveryDataSource.isSubscribed(delivery);
    return result.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(r);
      },
    );
  }

  @override
  Future<Either> createSubscription(
      String duration, String transportType) async {
    return await remoteDeliveryDataSource.createSubscription(
        duration, transportType);
  }
}
