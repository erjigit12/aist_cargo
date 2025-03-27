import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class CreateSendUsecase {
  CreateSendUsecase({required this.repository});

  final SendRepository repository;

  Future<Either> call(CreateDeliveryModel sendModel) async =>
      await repository.createSend(sendModel);
}
