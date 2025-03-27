import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteSendDataSource {
  Future<Either> isSubscribed(CreateDeliveryModel sendModel);
}
