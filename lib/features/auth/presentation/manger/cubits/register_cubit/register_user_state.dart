part of 'register_user_cubit.dart';

@immutable
sealed class RegisterUserState {}

final class RegisterUserInitial extends RegisterUserState {}

final class RegisterUserLoading extends RegisterUserState {}

final class RegisterUserSuccess extends RegisterUserState {
  final UserEntity userEntity;

  RegisterUserSuccess({required this.userEntity});
}

final class RegisterUserFailure extends RegisterUserState {
  final String failMessage;

  RegisterUserFailure({required this.failMessage});
}
