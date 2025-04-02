import 'dart:developer';
import 'dart:io';

import 'package:aist_cargo/src/feature/feature.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUserDataUsecase getUserDataUsecase;
  final UpdateUserDataUsecase updateUserDataUsecase;
  final PickImageUsecase pickImageUsecase;
  final UploadImageUsecase uploadImageUsecase;
  UserCubit({
    required this.getUserDataUsecase,
    required this.updateUserDataUsecase,
    required this.pickImageUsecase,
    required this.uploadImageUsecase,
  }) : super(UserInitial());

  void getUserData() async {
    emit(UserLoading());
    var result = await getUserDataUsecase.call();
    result.fold(
      (l) {
        emit(UserFailure(message: l));
      },
      (r) {
        emit(UserSuccess(user: r));
      },
    );
  }

  void updateUserData(UserModel userModel) async {
    final user = UserModel(
      firstName: userModel.firstName,
      lastName: userModel.lastName,
      email: userModel.email,
      phoneNumber: userModel.phoneNumber,
      dateOfBirth: userModel.dateOfBirth,
      image: userModel.image,
    );
    var result = await updateUserDataUsecase.call(user);
    result.fold(
      (l) {
        String errorMessage = l.toString();
        log('❌ Ката кетти: $errorMessage');
        emit(UserFailure(message: errorMessage));
      },
      (r) {
        emit(UserSuccess(user: r, isUpdated: true));
      },
    );
  }

  void uploadImage(File imageFile) async {
    emit(UserLoading());

    var result = await uploadImageUsecase.call(imageFile);
    result.fold((l) {
      emit(UserFailure(message: l));
    }, (r) {
      emit(UserSuccess(user: r as UserEntity));
    });
  }

  // Future<void> pickProfileImage(ImageSource source) async {
  //   if (state is! UserSuccess) return;

  //   final currentState = state as UserSuccess;
  //   emit(UserLoading());

  //   final result = await pickImageUsecase(source);

  //   result.fold(
  //     (error) => emit(UserFailure(message: error)),
  //     (imageFile) {
  //       // Конвертируем File в String (путь к файлу) или сохраняем File
  //       final imagePath = imageFile.path;

  //       // Создаем обновленный UserEntity
  //       final updatedUser = currentState.user.copyWith(
  //         image: imagePath, // или другой логикой обработки изображения
  //       );

  //       emit(currentState.copyWith(user: updatedUser));
  //     },
  //   );
  // }

  Future<void> pickProfileImage(ImageSource source) async {
    if (state is! UserSuccess) return;

    final currentState = state as UserSuccess;
    emit(UserLoading());

    final result = await pickImageUsecase(source);

    result.fold(
      (error) => emit(UserFailure(message: error)),
      (imageFile) {
        // Сохраняем File объект, а не путь
        final updatedUser = currentState.user.copyWith(
          imageFile: imageFile, // Сохраняем сам файл
          image: null, // Очищаем старый URL, если был
        );

        emit(currentState.copyWith(user: updatedUser));
      },
    );
  }

  Future<void> updateUserWithImage(UserEntity user) async {
    if (state is! UserSuccess) return;

    emit(UserLoading());

    try {
      String? imageUrl = user.image;

      // Если выбрано новое изображение (есть imageFile)
      if (user.imageFile != null) {
        // Загружаем изображение на сервер
        final uploadResult = await uploadImageUsecase.call(user.imageFile!);

        // Обрабатываем результат загрузки
        imageUrl = uploadResult.fold(
          (error) => throw Exception("Image upload failed: $error"),
          (url) => url, // Явное приведение типа
        );
      }

      // Создаем модель для обновления данных
      final userModel = UserModel(
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        phoneNumber: user.phoneNumber,
        dateOfBirth: user.dateOfBirth,
        image:
            imageUrl, // Используем новый URL или старый, если не было нового изображения
      );

      // Обновляем данные пользователя
      final updateResult = await updateUserDataUsecase.call(userModel);

      updateResult.fold(
        (error) => emit(UserFailure(message: error.toString())),
        (updatedUser) => emit(UserSuccess(
          user: updatedUser,
          isUpdated: true,
        )),
      );
    } catch (e) {
      emit(UserFailure(message: e.toString()));
    }
  }
}
