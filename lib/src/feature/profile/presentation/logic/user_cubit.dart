import 'package:aist_cargo/src/feature/feature.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUserDataUsecase getUserDataUsecase;
  UserCubit({required this.getUserDataUsecase}) : super(UserInitial());

  void getUserData() async {
    emit(UserLoading());
    var result = await getUserDataUsecase.call();
    result.fold(
      (l) => emit(UserFailure(message: l)),
      (r) => emit(UserSuccess(user: r)),
    );
  }
}
