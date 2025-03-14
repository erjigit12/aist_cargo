import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class SendRepositoryImpl implements SendRepository {
  SendRepositoryImpl({required this.remoteSendDataSource});

  final RemoteSendDataSource remoteSendDataSource;

  @override
  Future<Either> createSend(SendModel sendModel) async {
    return await remoteSendDataSource.createSend(sendModel);
  }
}
