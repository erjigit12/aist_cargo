import 'package:aist_cargo/injection_container.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class RemoteSendDataSourceImpl implements RemoteSendDataSource {
  @override
  Future<Either> createSend(SendModel sendModel) async {
    try {
      final response = await sl<DioClient>().post(
        ApiConst.createSendings,
        data: sendModel.toMap(),
      );
      return Right(response.data);
    } catch (e) {
      throw Exception(
          'Failed to create send: ${e.response?.data ?? e.message}');
    }
  }
}
