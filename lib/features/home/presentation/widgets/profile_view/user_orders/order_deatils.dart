import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../core/utils/widgets/default_icon.dart';
import 'order_time_line.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({
    super.key,
  });

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 19, bottom: 19),
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 243, 243, 0.5),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultIcon(
                icon: Icon(
                  Icons.shape_line,
                  color: AppColors.kPrimary,
                ),
                radius: 33,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'طلب رقم: 1234567#',
                    style: TextStyles.textStyle13Bold,
                  ),
                  Text(
                    'تم الطلب :22 مارس ,2024',
                    style: TextStyles.textStyle11SemiBold.copyWith(
                      color: Color(0xff949D9E),
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            'عدد الطلبات : ',
                            style: TextStyles.textStyle13SemiBold.copyWith(
                              color: Color(0xff949D9E),
                            ),
                          ),
                          Text(
                            '10',
                            style: TextStyles.textStyle13SemiBold,
                          ),
                        ],
                      ),
                      SizedBox(width: 15),
                      Text(
                        '250 جنية',
                        style: TextStyles.textStyle13Bold,
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isTapped = !isTapped;
                    });
                  },
                  child: isTapped
                      ? Icon(
                          Icons.keyboard_arrow_up_outlined,
                          size: 30,
                        )
                      : Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 30,
                        ),
                ),
              ),
            ],
          ),
          isTapped
              ? Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 243, 243, 0.5),
                  ),
                  child: Column(
                    children: [
                      Divider(),
                      SizedBox(height: 4),
                      SizedBox(
                        height: 154,
                        child: OrderTimeline(),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
