import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';

abstract class SendRepository {
  Future<Either> createSend(SendModel sendModel);
}
