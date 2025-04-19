import 'package:aist_cargo/injection_container.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/all/data/models/get_delivery_by_id.dart';
import 'package:aist_cargo/src/feature/all/data/models/get_send_by_id.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteAllDataSourceImpl implements RemoteAllDataSource {
  @override
  Future<DeliveryEntity> getDeliveryById(int id) async {
    final storage = await SharedPreferences.getInstance();
    final accessToken = storage.getString('accessToken');
    final response = await sl<DioClient>().get(
      ApiConst.getDeliveryById,
      queryParameters: {'Authorization': 'Bearer $accessToken'},
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
