import 'package:flutter/cupertino.dart';
import 'package:fruits_app/core/utils/constants.dart';
import 'package:fruits_app/core/utils/text_styles.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:fruits_app/core/utils/widgets/default_form_field.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(height: 24),
          Text(
            'لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.',
            style: TextStyles.textStyle16SemiBold.copyWith(
              color: Color(0xff616A6B),
            ),
          ),
          SizedBox(height: 31),
          DefaultFormField(
            onSaved: (value) {},
            hintText: 'أدخل رقم هاتفك المحمول',
            textInputType: TextInputType.phone,
            containsSuffix: false,
          ),
          SizedBox(height: 31),
          CustomButton(
              onPressed: () {
                context.push('/check');
              },
              text: 'نسيت كلمة المرور'),
        ],
      ),
    );
  }
}
