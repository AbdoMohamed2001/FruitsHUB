import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/text_styles.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTimeline extends StatelessWidget {
  const OrderTimeline({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: steps.length,
      itemBuilder: (context, index) {
        final step = steps[index];
        return TimelineTile(
          // alignment: TimelineAlign.manual,
          lineXY: 0.0,
          isFirst: index == 0,
          isLast: index == steps.length - 1,
          indicatorStyle: IndicatorStyle(
            width: 15,
            color: step['isDone'] ? AppColors.kPrimary : Colors.grey.shade300,
          ),
          beforeLineStyle: LineStyle(
            color: step['isDone'] ? AppColors.kPrimary : Colors.grey.shade300,
            thickness: 1,
          ),
          endChild: Padding(
            padding: const EdgeInsets.only(right: 11.0, top: 6, bottom: 6),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    step['title'],
                    style: TextStyles.textStyle13SemiBold.copyWith(
                      color: step['isDone'] ? Colors.black : Colors.grey,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(width: 10),
                Text(step['date'],
                    style: TextStyles.textStyle13SemiBold.copyWith(
                      color: Color(0xff949D9E),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}

final List<Map<String, dynamic>> steps = [
  {'title': 'تتبع الطلب', 'date': '22 مارس , 2024', 'isDone': true},
  {'title': 'قبول الطلب', 'date': '22 مارس , 2024', 'isDone': true},
  {'title': 'تم شحن الطلب', 'date': '22 مارس , 2024', 'isDone': true},
  {'title': 'خرج للتوصيل', 'date': 'قيد الانتظار', 'isDone': false},
  {'title': 'تم التسليم', 'date': 'تم التسليم', 'isDone': false},
];
