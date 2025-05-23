import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constants.dart';
import 'package:fruits_app/core/utils/widgets/arrow_back_widget.dart';
import 'package:fruits_app/core/utils/widgets/default_icon.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../generated/assets.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(height: 16),
          //appBar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ArrowBackWidget(),
              Text(
                'الاشعارات',
                style: TextStyles.textStyle19Bold,
              ),
              DefaultIcon(
                  icon: Icon(
                Icons.notifications_outlined,
                color: Color(0xff1B5E37),
              )),
            ],
          ),
          SizedBox(height: 20),
          NotificationType(
            text: 'جديد',
          ),
          SizedBox(height: 16),
          //new notifications
          SizedBox(
            height: 300,
            child: NewNotificationListView(),
          ),
          SizedBox(height: 11),
          NotificationType(
            text: 'في وقت سابق',
          ),
          SizedBox(height: 16),
          Expanded(
            child: NewNotificationListView(),
          ),
        ],
      ),
    );
  }
}

class NotificationType extends StatelessWidget {
  const NotificationType({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyles.textStyle16Bold,
        ),
        SizedBox(width: 6),
        CircleAvatar(
          backgroundColor: Color(0xffEBF9F1),
          radius: 14,
          child: Text(
            '2',
            style:
                TextStyles.textStyle13Bold.copyWith(color: Color(0xff1B5E37)),
          ),
        ),
        Spacer(),
        Text(
          'تحديد الكل مقروء',
          style:
              TextStyles.textStyle13Regular.copyWith(color: Color(0xff949D9E)),
        ),
      ],
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
            ),
            child: Image.asset(
              Assets.imagesAvatar,
            ),
          ),
          SizedBox(width: 13),
          Expanded(
            child: Text(
              'خصم 50% علي اسعار الفواكه بمناسبه العيد',
              style: TextStyles.textStyle16SemiBold,
            ),
          ),
          SizedBox(width: 13),
          Text(
            '9 صباحا',
            style: TextStyles.textStyle13Regular.copyWith(
              color: Color(0xff949D9E),
            ),
          ),
        ],
      ),
    );
  }
}

class NewNotificationListView extends StatelessWidget {
  const NewNotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, i) => SizedBox(height: 8),
      itemCount: 10,
      itemBuilder: (_, i) => NotificationItem(),
    );
  }
}
