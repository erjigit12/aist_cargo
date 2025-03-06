import 'package:aist_cargo/src/feature/feature.dart';
import 'package:bloc/bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUserDataUsecase getUserDataUsecase;
  final UpdateUserDataUsecase updateUserDataUsecase;
  UserCubit({
    required this.getUserDataUsecase,
    required this.updateUserDataUsecase,
  }) : super(UserInitial());

  void getUserData() async {
    emit(UserLoading());
    var result = await getUserDataUsecase.call(14);
    result.fold(
      (l) => emit(UserFailure(message: l)),
      (r) => emit(UserSuccess(user: r)),
    );
  }

  void updateUserData(UserModel userModel) async {
    final user = UserModel(
      id: userModel.id,
      firstName: userModel.firstName,
      lastName: userModel.lastName,
      email: userModel.email,
      phoneNumber: userModel.phoneNumber,
      dateOfBirth: userModel.dateOfBirth,
      image: userModel.image,
    );
    var result = await updateUserDataUsecase.call(user);
    result.fold(
      (l) => emit(UserFailure(message: l)),
      (r) => emit(UserSuccess(user: r)),
    );
  }
}
