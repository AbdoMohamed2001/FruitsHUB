import 'package:bloc/bloc.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entites/user_entity.dart';

part 'register_user_state.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  RegisterUserCubit({required this.authRepo}) : super(RegisterUserInitial());
  final AuthRepo authRepo;

  Future<void> registerUser({
    required String email,
    required String password,
    required String name,
    required String imageUrl,
  }) async {
    emit(RegisterUserLoading());
    final result = await authRepo.register(email, password, name, imageUrl);
    result.fold(
      (failure) => emit(RegisterUserFailure(failMessage: failure.message)),
      (userEntity) => emit(RegisterUserSuccess(userEntity: userEntity)),
    );
  }
}
