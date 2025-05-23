import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/constants.dart';
import 'package:fruits_app/core/utils/functions/build_error_bar.dart';
import 'package:fruits_app/core/utils/text_styles.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:fruits_app/core/utils/widgets/default_form_field.dart';
import 'package:fruits_app/features/auth/presentation/register/views/widgets/passwordFormField.dart';
import 'package:fruits_app/features/auth/presentation/register/views/widgets/terms_widget.dart';
import 'package:go_router/go_router.dart';

import '../../../manger/cubits/register_cubit/register_user_cubit.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  late bool isTermAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            //name
            DefaultFormField(
              onSaved: (value) {
                name = value!;
              },
              hintText: 'الاسم كامل',
              textInputType: TextInputType.text,
              containsSuffix: false,
            ),
            SizedBox(height: 16),
            //email
            DefaultFormField(
              onSaved: (value) {
                email = value!;
              },
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
              containsSuffix: false,
            ),
            SizedBox(height: 16),
            //password
            PasswordFormField(
              onSaved: (value) {
                password = value!;
              },
              hintText: 'كلمة المرور',
              textInputType: TextInputType.emailAddress,
              containsSuffix: true,
            ),
            SizedBox(height: 16),
            //terms
            TermsWidget(
              onTermAccepted: (value) {
                isTermAccepted = value;
              },
            ),
            SizedBox(height: 30),
            //button
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  if (isTermAccepted) {
                    context.read<RegisterUserCubit>().registerUser(
                          email: email,
                          password: password,
                          name: name,
                          imageUrl:
                              'https://ouurzampyyfbmhtgnvai.supabase.co/storage/v1/object/public/fruits-images/images/avatar.png',
                        );
                  } else {
                    showSnackBar(context, 'يجب عليك قبول الشروط والأحكام');
                  }
                } else {
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
                }
                return;
              },
              text: 'إنشاء حساب جديد',
            ),
            SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تمتلك حساب بالفعل؟',
                  style: TextStyles.textStyle16SemiBold.copyWith(
                    color: Color(0xff949D9E),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Text(
                    ' تسجيل دخول',
                    style: TextStyles.textStyle16SemiBold.copyWith(
                      color: AppColors.kPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
