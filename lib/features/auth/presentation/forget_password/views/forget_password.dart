import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/auth/presentation/forget_password/views/widgets/forget_password_body.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'نسيان كلمة المرور'),
      body: ForgetPasswordBody(),
    );
  }
}
