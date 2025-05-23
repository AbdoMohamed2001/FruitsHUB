import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/functions/build_error_bar.dart';
import 'package:fruits_app/core/utils/text_styles.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/constants.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:fruits_app/core/utils/widgets/default_form_field.dart';
import 'package:fruits_app/generated/assets.dart';

import '../../../../../../core/utils/widgets/or_widget.dart';
import '../../../../../../core/utils/widgets/social_button.dart';
import '../../../manger/cubits/login_cubit/login_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            //email
            DefaultFormField(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
              containsSuffix: false,
              onSaved: (value) {
                email = value!;
              },
            ),
            SizedBox(
              height: 16,
            ),
            //password
            DefaultFormField(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              containsSuffix: true,
              onSaved: (value) {
                password = value!;
              },
            ),
            SizedBox(height: 16),
            //forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/forget');
                  },
                  child: Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.textStyle13SemiBold.copyWith(
                      color: Color(0xff2D9F5D),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 33),
            //sign in button
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
                  context.read<LoginCubit>().login(email, password);
                } else {
                  return;
                }
              },
              text: 'تسجيل دخول',
            ),
            SizedBox(
              height: 45,
            ),
            //don't have an account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لا تمتلك حساب؟',
                  style: TextStyles.textStyle16SemiBold.copyWith(
                    color: Color(0xff949D9E),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  child: Text(
                    ' قم بإنشاء حساب',
                    style: TextStyles.textStyle16SemiBold.copyWith(
                      color: AppColors.kPrimary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 49,
            ),
            OrWidget(text: 'أو'),
            SizedBox(
              height: 31,
            ),
            //Social Buttons
            SocialButton(
              onTap: () {
                context.read<LoginCubit>().loginWithGoogle();
              },
              text: 'تسجيل بواسطة جوجل',
              image: Assets.imagesGoogle,
            ),
            SizedBox(
              height: 16,
            ),
            SocialButton(
              onTap: () {
                showSnackBar(context, 'سيتم تفعيل هذه الميزة قريبا ');
              },
              text: 'تسجيل بواسطة أبل',
              image: Assets.imagesApple,
            ),
            SizedBox(
              height: 16,
            ),
            SocialButton(
              onTap: () {
                context.read<LoginCubit>().loginWithFacebook();
              },
              text: 'تسجيل بواسطة فيسبوك',
              image: Assets.imagesFacebook,
            ),
          ],
        ),
      ),
    );
  }
}
