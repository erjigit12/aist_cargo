import 'package:aist_cargo/src/feature/feature.dart';

class GetSendByIdUsecase {
  final AllRepo allRepo;

  GetSendByIdUsecase({required this.allRepo});

  Future<SendEntity> call(int id) async => await allRepo.getSendById(id);
}
