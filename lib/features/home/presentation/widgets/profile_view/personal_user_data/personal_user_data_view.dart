import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/functions/build_error_bar.dart';
import 'package:fruits_app/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/home/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/personal_user_data/personal_user_data_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PersonalUserDataView extends StatelessWidget {
  const PersonalUserDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الملف الشخصي'),
      body: SafeArea(
          child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
        if (state is ProfileFailure) {
          showSnackBar(context, state.failMessage);
        } else if (state is ProfileSuccess) {
          // showSnackBar(context, 'تم تعديل البينات بنجاح ');
        }
        // TODO: implement listener
      }, builder: (context, state) {
        return Skeletonizer(
            enabled: state is ProfileLoading,
            child: PersonalUserDataViewBody());
      })),
    );
  }
}
