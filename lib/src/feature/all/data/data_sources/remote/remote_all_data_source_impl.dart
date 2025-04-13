import 'package:aist_cargo/injection_container.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/all/data/models/get_delivery_by_id.dart';
import 'package:aist_cargo/src/feature/all/data/models/get_send_by_id.dart';
import 'package:aist_cargo/src/feature/feature.dart';

class RemoteAllDataSourceImpl implements RemoteAllDataSource {
  @override
  Future<DeliveryEntity> getDeliveryById(int id) async {
    final response = await sl<DioClient>().get(
      '${ApiConst.getDeliveryById}/$id',
    );
    return GetDeliveryById.fromJson(response.data);
  }

  @override
  Future<SendEntity> getSendById(int id) async {
    final response = await sl<DioClient>().get(
      '${ApiConst.getSendById}/$id',
    );
    return GetSendById.fromJson(response.data);
  }
}
