import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/text_styles.dart';

class CheckCodeBody extends StatelessWidget {
  const CheckCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: <Widget>[
          SizedBox(height: 24),
          Text(
            'أدخل الرمز الذي أرسلناه إلى عنوان بريد التالي Maxxx@email.com',
            style: TextStyles.textStyle16SemiBold.copyWith(
              color: Color(0xff616A6B),
            ),
          ),
          SizedBox(height: 29),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: 74,
                decoration: BoxDecoration(
                  color: Color(0xffF9FAFA),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    '9',
                    style: TextStyles.textStyle23Bold,
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 74,
                decoration: BoxDecoration(
                  color: Color(0xffF9FAFA),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    '9',
                    style: TextStyles.textStyle23Bold,
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 74,
                decoration: BoxDecoration(
                  color: Color(0xffF9FAFA),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    '9',
                    style: TextStyles.textStyle23Bold,
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 74,
                decoration: BoxDecoration(
                  color: Color(0xffF9FAFA),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    '9',
                    style: TextStyles.textStyle23Bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 29),
          CustomButton(
              onPressed: () {
                context.push('/new_password');
              },
              text: 'تحقق من الرمز'),
          SizedBox(height: 24),
          Text(
            'إعادة إرسال الرمز',
            style: TextStyles.textStyle16SemiBold
                .copyWith(color: Color(0xff2D9F5D)),
          ),
        ],
      ),
    );
  }
}
