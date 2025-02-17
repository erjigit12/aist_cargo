import 'package:aist_cargo/src/feature/feature.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Bloc
  sl.registerFactory<MainCubit>(() => MainCubit());

  sl.registerFactory<OtpBloc>(() => OtpBloc());

  sl.registerFactory<HomeCubit>(() => HomeCubit());

  /// Network
  sl.registerSingleton<DioClient>(DioClient());

  /// External
  final dio = Dio();

  sl.registerLazySingleton(() => dio);
}
