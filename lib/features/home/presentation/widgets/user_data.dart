import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/functions/getCachedUserData.dart';
import 'package:fruits_app/core/utils/text_styles.dart';
import 'package:fruits_app/features/home/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:fruits_app/features/home/presentation/widgets/search_view/search_bar_disabled.dart';
import 'package:fruits_app/generated/assets.dart';

import '../../../../core/utils/widgets/default_icon.dart';

class UserDataWidget extends StatelessWidget {
  const UserDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        //appBar
        BlocBuilder<ProfileCubit, ProfileState>(
          buildWhen: (previous, current) => current is ProfileSuccess,
          builder: (context, state) {
            if (state is ProfileSuccess) {
              return SizedBox(
                height: 54,
                child: Row(
                  children: [
                    //image
                    CircleAvatar(
                      radius: 24,
                      child: Image.asset(
                        Assets.imagesAvatar,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 11),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'صباح الخير !..',
                            style: TextStyles.textStyle16Regular.copyWith(
                              color: Color(0xff949D9E),
                            ),
                          ),
                          Text(
                            getCachedUserData().name,
                            style: TextStyles.textStyle16Bold,
                          ),
                        ],
                      ),
                    ),
                    //notification
                    DefaultIcon(
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: Color(0xff1B5E37),
                      ),
                    ),
                  ],
                ),
              );
            }
            return SizedBox(
              height: 54,
              child: Row(
                children: [
                  //image
                  CircleAvatar(
                    radius: 24,
                    child: Image.asset(
                      Assets.imagesAvatar,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 11),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'صباح الخير !..',
                          style: TextStyles.textStyle16Regular.copyWith(
                            color: Color(0xff949D9E),
                          ),
                        ),
                        Text(
                          getCachedUserData().name,
                          style: TextStyles.textStyle16Bold,
                        ),
                      ],
                    ),
                  ),
                  //notification
                  DefaultIcon(
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: Color(0xff1B5E37),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Color(0xff000000).withValues(alpha: 0.04),
                blurRadius: 9,
                offset: Offset(0, 2),
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: DisabledSearchBar(),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
