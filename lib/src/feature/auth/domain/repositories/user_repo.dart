import 'package:aist_cargo/src/feature/feature.dart';

abstract class UserRepository {
  Future<void> register(UserEntity userEntity);
  Future<void> login(UserEntity userEntity);
}
