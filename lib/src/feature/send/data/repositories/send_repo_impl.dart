import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

class SendRepositoryImpl implements SendRepository {
  SendRepositoryImpl({required this.remoteSendDataSource});

  final RemoteSendDataSource remoteSendDataSource;

  @override
  Future<Either> isSubscribed(CreateDeliveryModel sendModel) async {
    Either result = await remoteSendDataSource.isSubscribed(sendModel);

    return result.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(r);
      },
    );
  }
}
