import 'package:aist_cargo/src/feature/feature.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Bloc
  sl.registerFactory<MainCubit>(() => MainCubit());
}
