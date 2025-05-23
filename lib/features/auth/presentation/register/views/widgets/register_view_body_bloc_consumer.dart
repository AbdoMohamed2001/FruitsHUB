import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/functions/build_error_bar.dart';
import 'package:fruits_app/features/auth/presentation/register/views/widgets/register_view_body.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../manger/cubits/register_cubit/register_user_cubit.dart';

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterUserCubit, RegisterUserState>(
      listener: (context, state) {
        if (state is RegisterUserFailure) {
          showSnackBar(context, state.failMessage);
        } else if (state is RegisterUserSuccess) {
          context.go('/home');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterUserLoading ? true : false,
          progressIndicator: CircularProgressIndicator(
            color: AppColors.kPrimary,
          ),
          child: RegisterViewBody(),
        );
      },
    );
  }
}
