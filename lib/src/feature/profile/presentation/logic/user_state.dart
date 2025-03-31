part of 'user_cubit.dart';

sealed class UserState {
  const UserState();
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  const UserSuccess({required this.user, this.isUpdated = false});

  final UserEntity user;
  final bool isUpdated;

  UserSuccess copyWith({
    UserEntity? user,
    bool? isUpdated,
  }) {
    return UserSuccess(
      user: user ?? this.user,
      isUpdated: isUpdated ?? this.isUpdated,
    );
  }
}

final class UserFailure extends UserState {
  const UserFailure({required this.message});

  final String message;
}
