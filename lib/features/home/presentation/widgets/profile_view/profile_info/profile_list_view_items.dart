import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_app/features/home/presentation/cubits/profile_cubit/profile_cubit.dart';

import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../core/utils/widgets/custom_switch.dart';
import '../../../../../../generated/assets.dart';
import '../../../../domain/entities/profile_view_entity.dart';

List profileListWithArrowIcon = [
  ProfileViewEntity(
    text: 'الملف الشخصي',
    icon: Assets.outlinedUserOutlined,
    nextPageName: '/personal_user_data',
  ),
  ProfileViewEntity(
    text: 'طلباتي',
    icon: Assets.imagesBox,
    nextPageName: '/orders',
  ),
  ProfileViewEntity(
    text: 'المدفوعات',
    icon: Assets.imagesEmptyWallet,
    nextPageName: '/payments',
  ),
  ProfileViewEntity(
    text: 'المفضلة',
    icon: Assets.imagesHeart,
    nextPageName: '/favourites',
  ),
];

class ProfileListItemWithArrowIcon extends StatelessWidget {
  const ProfileListItemWithArrowIcon({
    super.key,
    required this.image,
    required this.text,
    required this.pageName,
  });

  final String image;
  final String text;
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (pageName == '/personal_user_data') {
          Navigator.pushNamed(
            context,
            pageName,
            arguments: context.read<ProfileCubit>(),
          );
        }
        Navigator.pushNamed(
          context,
          pageName,
          arguments: context.read<ProductsCubit>(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              image,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                Color(0xff1B5E37),
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 9),
            Text(
              text,
              style: TextStyles.textStyle13SemiBold.copyWith(
                color: Color(0xff949D9E),
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

//--------------------------------------------------------------------------
class ProfileListItemWithoutArrowIcon extends StatelessWidget {
  const ProfileListItemWithoutArrowIcon({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            image,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              Color(0xff1B5E37),
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 9),
          Text(
            text,
            style: TextStyles.textStyle13SemiBold.copyWith(
              color: Color(0xff949D9E),
            ),
          ),
          Spacer(),
          CustomSwitch(),
        ],
      ),
    );
  }
}

List profileListWithoutIcon = [
  ProfileViewEntity(
    text: 'الاشعارات',
    icon: Assets.imagesNotification,
  ),
  ProfileViewEntity(
    text: 'اللغة',
    icon: Assets.imagesGlobal,
  ),
  ProfileViewEntity(
    text: 'الوضع',
    icon: Assets.imagesMagicpen,
  ),
];
