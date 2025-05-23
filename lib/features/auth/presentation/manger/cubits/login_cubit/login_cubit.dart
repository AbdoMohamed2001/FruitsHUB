import 'package:bloc/bloc.dart';
import 'package:fruits_app/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  void login(String email, String password) async {
    emit(LoginLoading());
    var result = await authRepo.login(email, password);
    result.fold(
      (failure) {
        emit(LoginFailure(failMessage: failure.message));
      },
      (userEntity) {
        emit(LoginSuccess(userEntity: userEntity));
      },
    );
  }

  void loginWithGoogle() async {
    emit(LoginLoading());
    var result = await authRepo.loginWithGoogle();
    result.fold(
      (failure) {
        emit(LoginFailure(failMessage: failure.message));
      },
      (userEntity) {
        emit(LoginSuccess(userEntity: userEntity));
      },
    );
  }

  void loginWithFacebook() async {
    emit(LoginLoading());
    var result = await authRepo.loginWithFacebook();
    result.fold(
      (failure) {
        emit(LoginFailure(failMessage: failure.message));
      },
      (userEntity) {
        emit(LoginSuccess(userEntity: userEntity));
      },
    );
  }
}
