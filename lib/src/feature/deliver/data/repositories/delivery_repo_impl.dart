import 'dart:developer';

import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  Future<Either<String, CreateDeliveryModel>> createDelivery(
      CreateDeliveryModel delivery) async {
    Either result = await remoteDeliveryDataSource.createDelivery(delivery);
    return result.fold(
      (l) {
        return Left(l);
      },
      (r) async {
        final delivery = r as CreateDeliveryModel;

        log("✅ Delivery ID: ${delivery.id}");
        SharedPreferences storage = await SharedPreferences.getInstance();
        storage.setInt('deliveryId', delivery.id ?? -1);

        return Right(delivery);
      },
    );
  }
}
