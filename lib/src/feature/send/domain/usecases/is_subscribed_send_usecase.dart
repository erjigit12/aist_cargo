import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class IsSubscribedSendUsecase {
  final SendRepository repository;

  IsSubscribedSendUsecase(this.repository);

  Future<Either> call(CreateDeliveryModel send) async =>
      await repository.isSubscribed(send);
}
