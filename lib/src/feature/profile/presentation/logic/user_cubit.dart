import 'dart:developer';

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

  Future<void> pickProfileImage(ImageSource source) async {
    if (state is! UserSuccess) return;

    final currentState = state as UserSuccess;
    emit(UserLoading());

    final result = await pickImageUsecase(source);

    result.fold(
      (error) => emit(UserFailure(message: error)),
      (imageFile) {
        // Конвертируем File в String (путь к файлу) или сохраняем File
        final imagePath = imageFile.path;

        // Создаем обновленный UserEntity
        final updatedUser = currentState.user.copyWith(
          image: imagePath, // или другой логикой обработки изображения
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

      // 1. Загружаем новое изображение если есть
      if (user.imageFile != null) {
        final uploadResult = await uploadImageUsecase(user.imageFile!);
        imageUrl = uploadResult.fold(
          (error) => throw Exception(error),
          (url) => url,
        );
      }

      // 2. Конвертируем UserEntity в UserModel (если требуется)
      final userModel = UserModel(
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        phoneNumber: user.phoneNumber,
        dateOfBirth: user.dateOfBirth,
        image: imageUrl,
      );

      // 3. Обновляем данные пользователя
      final updateResult = await updateUserDataUsecase(userModel);

      updateResult.fold(
        (error) => emit(UserFailure(message: error)),
        (updatedUserModel) {
          // 4. Обновляем состояние - используем user с обновленным imageUrl
          emit(UserSuccess(
            user: user.copyWith(image: imageUrl),
            isUpdated: true,
          ));
        },
      );
    } catch (e) {
      emit(UserFailure(message: 'Ошибка обновления: ${e.toString()}'));
    }
  }
}
