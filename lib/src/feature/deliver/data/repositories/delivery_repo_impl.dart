import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class DeliveryRepositoryImpl implements DeliveryRepository {
  DeliveryRepositoryImpl({required this.remoteDeliveryDataSource});

  final RemoteDeliveryDataSource remoteDeliveryDataSource;

  @override
  Future<Either> createDelivery(CreateDeliveryModel delivery) async {
    Either result = await remoteDeliveryDataSource.createDelivery(delivery);
    return result.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(r);
      },
    );
  }
}
