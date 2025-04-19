import 'package:aist_cargo/src/feature/feature.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Bloc
  sl.registerFactory<MainCubit>(() => MainCubit());

  sl.registerFactory<OtpBloc>(() => OtpBloc());

  sl.registerFactory<HomeCubit>(() => HomeCubit());

  sl.registerFactory<CredentialCubit>(
    () => CredentialCubit(
        signupUsecase: sl.call(),
        signinUsecase: sl.call(),
        logoutUsecase: sl.call(),
        otpUsecase: sl.call()),
  );

  sl.registerFactory<AuthCubit>(
    () => AuthCubit(isLoggedInUsecase: sl.call()),
  );

  sl.registerFactory<UserCubit>(
    () => UserCubit(
      getUserDataUsecase: sl.call(),
      updateUserDataUsecase: sl.call(),
      pickImageUsecase: sl.call(),
      uploadImageUsecase: sl.call(),
    ),
  );

  sl.registerFactory<DeliveryCubit>(
    () => DeliveryCubit(
      isSubscribedUsecase: sl.call(),
      createSubscriptionUsecase: sl.call(),
      createDeliveryUsecase: sl.call(),
    ),
  );

  sl.registerFactory<SendCubit>(
    () => SendCubit(
      createSendUsecase: sl.call(),
      isSubscribedSendUsecase: sl.call(),
    ),
  );

  sl.registerFactory<AllCubit>(
    () => AllCubit(
      getDeliveryByIdUsecase: sl.call(),
      getSendByIdUsecase: sl.call(),
    ),
  );

  //! Use Cases
  sl.registerLazySingleton<SignupUsecase>(
    () => SignupUsecase(authRepository: sl.call()),
  );

  sl.registerLazySingleton<SigninUsecase>(
    () => SigninUsecase(authRepository: sl.call()),
  );

  sl.registerLazySingleton<LogoutUsecase>(
    () => LogoutUsecase(authRepository: sl.call()),
  );

  sl.registerLazySingleton<OtpUsecase>(
    () => OtpUsecase(authRepository: sl.call()),
  );

  sl.registerLazySingleton<IsLoggedInUsecase>(
    () => IsLoggedInUsecase(authRepository: sl.call()),
  );

  sl.registerLazySingleton<GetUserDataUsecase>(
    () => GetUserDataUsecase(repository: sl.call()),
  );

  sl.registerLazySingleton<UpdateUserDataUsecase>(
    () => UpdateUserDataUsecase(repository: sl.call()),
  );

  sl.registerLazySingleton<IsSubscribedUsecase>(
    () => IsSubscribedUsecase(repository: sl.call()),
  );

  sl.registerLazySingleton<IsSubscribedSendUsecase>(
    () => IsSubscribedSendUsecase(repository: sl.call()),
  );

  sl.registerLazySingleton<CreateSendUsecase>(
    () => CreateSendUsecase(repository: sl.call()),
  );

  sl.registerLazySingleton<CreateSubscriptionUsecase>(
    () => CreateSubscriptionUsecase(repository: sl.call()),
  );

  sl.registerLazySingleton<CreateDeliveryUsecase>(
    () => CreateDeliveryUsecase(repository: sl.call()),
  );

  sl.registerLazySingleton<PickImageUsecase>(
      () => PickImageUsecase(picker: sl.call()));

  sl.registerLazySingleton<UploadImageUsecase>(
      () => UploadImageUsecase(repository: sl.call()));

  sl.registerLazySingleton<GetDeliveryByIdUsecase>(
    () => GetDeliveryByIdUsecase(repository: sl.call()),
  );

  sl.registerLazySingleton<GetSendByIdUsecase>(
      () => GetSendByIdUsecase(repository: sl.call()));

  //! Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
        remoteAuthDataSource: sl.call(), localAuthDataSource: sl.call()),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteUserDataSource: sl.call()),
  );

  sl.registerLazySingleton<DeliveryRepository>(
    () => DeliveryRepositoryImpl(remoteDeliveryDataSource: sl.call()),
  );

  sl.registerLazySingleton<SendRepository>(
    () => SendRepositoryImpl(remoteSendDataSource: sl.call()),
  );

  sl.registerLazySingleton<AllRepo>(
    () => AllRepoImpl(remoteAllDataSource: sl.call()),
  );

  //! Data Sources
  sl.registerLazySingleton<RemoteAuthDataSource>(
    () => RemoteAuthDataSourceImpl(dio: sl.call()),
  );

  sl.registerLazySingleton<LocalAuthDataSource>(
    () => LocalAuthDataSourceImpl(),
  );

  sl.registerLazySingleton<RemoteUserDataSource>(
    () => RemoteUserDataSourceImpl(),
  );

  sl.registerLazySingleton<RemoteDeliveryDataSource>(
    () => RemoteDeliveryDataSourceImpl(),
  );

  sl.registerLazySingleton<RemoteSendDataSource>(
      () => RemoteSendDataSourceImpl());

  sl.registerLazySingleton<RemoteAllDataSource>(
      () => RemoteAllDataSourceImpl());

  //! Network
  sl.registerSingleton<DioClient>(DioClient());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  final dio = Dio();
  final imagePicker = ImagePicker();

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => dio);
  sl.registerLazySingleton(() => imagePicker);
}
