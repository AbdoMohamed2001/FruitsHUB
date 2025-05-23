import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constants.dart';
import 'package:fruits_app/core/utils/text_styles.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/profile_info/user_info.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/profile_info/profile_list_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/profile_info/profile_list_view_items.dart';
import '../../../../../../generated/assets.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: deviceHeight * 0.01),
          AppBar(
            title: Text(
              'حسابي',
              style: TextStyles.textStyle19Bold,
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          SizedBox(height: deviceHeight * 0.018),
          //Profile Info
          UserInfoWidget(),
          SizedBox(height: deviceHeight * 0.018),
          Text(
            'عام',
            style: TextStyles.textStyle13SemiBold,
          ),
          SizedBox(height: deviceHeight * 0.016),
          //Profile List
          ProfileListView(
            list: profileListWithArrowIcon,
          ),
          ProfileListView(
            list: profileListWithoutIcon,
            containsArrowIcon: false,
          ),
          Divider(
            height: 1,
            color: Color(0xffF2F3F3),
          ),
          SizedBox(height: deviceHeight * 0.024),
          Text(
            'المساعده',
            style: TextStyles.textStyle13SemiBold,
          ),
          SizedBox(height: deviceHeight * 0.018),
          ProfileListItemWithArrowIcon(
            image: Assets.imagesInfoCircle,
            text: 'من نحن',
            pageName: 'about_us',
          ),
          SizedBox(height: deviceHeight * 0.065),
          Container(
            height: 41,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffEBF9F1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'تسجيل الخروج',
                style: TextStyles.textStyle13SemiBold,
              ),
            ),
          ),
          SizedBox(height: deviceHeight * 0.035),
        ],
      ),
    );
  }
}
