import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class DeliveryRepositoryImpl implements DeliveryRepository {
  DeliveryRepositoryImpl({required this.remoteDeliveryDataSource});

  final RemoteDeliveryDataSource remoteDeliveryDataSource;

  @override
  Future<Either> createDelivery(
    String fromWhere,
    String toWhere,
    String dispatchDate,
    String arrivalDate,
    String description,
  ) async {
    Either result = await remoteDeliveryDataSource.createDelivery(
      fromWhere,
      toWhere,
      dispatchDate,
      arrivalDate,
      description,
    );
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
