import 'package:aist_cargo/src/feature/feature.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalAuthDataSourceImpl implements LocalAuthDataSource {
  @override
  Future<bool> isLoggedIn() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    var accessToken = storage.getString('accessToken');
    if (accessToken == null) return false;
    return true;
  }

  @override
  Future<Either> logOut() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.clear();
    return const Right(true);
  }
}
