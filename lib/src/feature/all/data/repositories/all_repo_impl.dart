import 'package:aist_cargo/src/feature/feature.dart';

class AllRepoImpl implements AllRepo {
  AllRepoImpl({required this.remoteAllDataSource});

  final RemoteAllDataSource remoteAllDataSource;

  @override
  Future<DeliveryEntity> getDeliveryById(int id) async {
    return await remoteAllDataSource.getDeliveryById(id);
  }

  @override
  Future<SendEntity> getSendById(int id) async {
    return await remoteAllDataSource.getSendById(id);
  }
}
