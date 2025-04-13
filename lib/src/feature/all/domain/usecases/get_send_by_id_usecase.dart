import 'package:aist_cargo/src/feature/feature.dart';

class GetSendByIdUsecase {
  final AllRepo repository;

  GetSendByIdUsecase({required this.repository});

  Future<SendEntity> call(int id) async => await repository.getSendById(id);
}
