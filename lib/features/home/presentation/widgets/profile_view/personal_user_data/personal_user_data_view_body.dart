import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/utils/functions/build_error_bar.dart';
import 'package:fruits_app/core/utils/functions/getCachedUserData.dart';
import 'package:fruits_app/core/utils/text_styles.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:fruits_app/core/utils/widgets/custom_text_field.dart';
import 'package:fruits_app/features/auth/presentation/register/views/widgets/passwordFormField.dart';
import 'package:fruits_app/features/home/presentation/cubits/profile_cubit/profile_cubit.dart';

import '../../../../../../generated/assets.dart';

class PersonalUserDataViewBody extends StatefulWidget {
  const PersonalUserDataViewBody({super.key});

  @override
  State<PersonalUserDataViewBody> createState() =>
      _PersonalUserDataViewBodyState();
}

class _PersonalUserDataViewBodyState extends State<PersonalUserDataViewBody> {
  String? userName, email, currentPassword, newPassword, confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height, // full screen height
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 28),
                Text(
                  'المعلومات الشخصيه',
                  style: TextStyles.textStyle13SemiBold,
                ),
                SizedBox(height: 8),
                //Name
                CustomTextField(
                  onChanged: (value) {
                    userName = value?.trim();
                  },
                  hintText: getCachedUserData().name,
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SvgPicture.asset(
                        Assets.imagesEdit,
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                //Email
                CustomTextField(
                  hintText: getCachedUserData().email,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SvgPicture.asset(
                      Assets.imagesEdit,
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'تغيير كلمة المرور',
                  style: TextStyles.textStyle13SemiBold,
                ),
                SizedBox(height: 8),
                //password
                PasswordFormField(
                  hintText: 'كلمة المرور الحالي',
                  textInputType: TextInputType.visiblePassword,
                  containsSuffix: true,
                ),
                SizedBox(height: 8),
                //newPassword
                PasswordFormField(
                  hintText: 'كلمة المرور الجديده',
                  textInputType: TextInputType.text,
                  containsSuffix: true,
                ),
                SizedBox(height: 8),
                //confirmPassword
                PasswordFormField(
                  hintText: 'تأكيد كلمة المرور الجديده',
                  textInputType: TextInputType.text,
                  containsSuffix: true,
                ),
                SizedBox(height: 8),
                Spacer(),
                CustomButton(
                    onPressed: () async {
                      final cachedData = getCachedUserData();

                      bool somethingChanged = false;

                      // Check username
                      if (userName != null &&
                          userName!.trim() != cachedData.name) {
                        context.read<ProfileCubit>().updateUserName(
                            userId: cachedData.id, name: userName!.trim());
                        somethingChanged = true;
                      }

                      // Check email
                      if (email != null && email!.trim() != cachedData.email) {
                        context.read<ProfileCubit>().updateEmail(
                            userId: cachedData.id, email: email!.trim());
                        somethingChanged = true;
                      }

                      // Check password
                      if (currentPassword != null &&
                          newPassword != null &&
                          confirmPassword != null) {
                        if (newPassword != confirmPassword) {
                          showSnackBar(context,
                              'كلمة المرور الجديده وتأكيدها غير متطابقين');
                          return;
                        }

                        try {
                          final user = FirebaseAuth.instance.currentUser!;
                          final credential = EmailAuthProvider.credential(
                            email: user.email!,
                            password: currentPassword!,
                          );

                          await user.reauthenticateWithCredential(credential);
                          await user.updatePassword(newPassword!);
                          somethingChanged = true;
                        } catch (e) {
                          log(e.toString());
                          showSnackBar(
                              context, 'كلمة المرور الحاليه غير صحيحه');
                          return;
                        }
                      }

                      if (!somethingChanged) {
                        showSnackBar(context, 'لم يتم تعديل اي بيانات');
                      } else {
                        showSnackBar(context, 'تم حفظ التغييرات بنجاح');
                      }
                    },
                    text: 'حفظ التغييرات'),
                SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
