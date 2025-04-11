import 'package:aist_cargo/src/feature/feature.dart';

class AllRepoImpl implements AllRepo {
  AllRepoImpl({required this.remoteAllDataSource});

  final RemoteAllDataSource remoteAllDataSource;

  @override
  Future<DeliveryEntity> getDeliveryById(int id) {
    return remoteAllDataSource.getDeliveryById(id);
  }
}
