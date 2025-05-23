import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/functions/getCachedUserData.dart';
import 'package:fruits_app/features/home/presentation/cubits/profile_cubit/profile_cubit.dart';

import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../core/utils/widgets/default_icon.dart';
import '../../../../../../generated/assets.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => current is ProfileSuccess,
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //image
              SizedBox(
                height: 89,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      child: Image.asset(
                        Assets.imagesAvatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: -2,
                      left: 0,
                      right: 0,
                      child: DefaultIcon(
                        radius: 16,
                        icon: SvgPicture.asset(
                          Assets.imagesCamera,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 36),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getCachedUserData().name,
                    style: TextStyles.textStyle13Bold,
                  ),
                  SizedBox(height: 2),
                  Text(
                    getCachedUserData().email,
                    style: TextStyles.textStyle13Regular.copyWith(
                      color: Color(0xff888FA0),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //image
            SizedBox(
              height: 89,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 36,
                    child: Image.asset(
                      Assets.imagesAvatar,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: -2,
                    left: 0,
                    right: 0,
                    child: DefaultIcon(
                      radius: 16,
                      icon: SvgPicture.asset(
                        Assets.imagesCamera,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 36),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  getCachedUserData().name,
                  style: TextStyles.textStyle13Bold,
                ),
                SizedBox(height: 2),
                Text(
                  getCachedUserData().email,
                  style: TextStyles.textStyle13Regular.copyWith(
                    color: Color(0xff888FA0),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
