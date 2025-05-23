import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/services/get_it_services_locator.dart';
import 'package:fruits_app/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_app/features/auth/presentation/manger/cubits/register_cubit/register_user_cubit.dart';
import 'package:fruits_app/features/auth/presentation/register/views/widgets/register_view_body.dart';
import 'package:fruits_app/features/auth/presentation/register/views/widgets/register_view_body_bloc_consumer.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterUserCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(title: 'حساب جديد'),
        body: RegisterViewBodyBlocConsumer(),
      ),
    );
  }
}
