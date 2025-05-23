import 'package:flutter/cupertino.dart';
import 'package:fruits_app/core/utils/constants.dart';
import 'package:fruits_app/core/utils/text_styles.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:fruits_app/core/utils/widgets/default_form_field.dart';

class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: <Widget>[
          SizedBox(height: 24),
          Text(
            'قم بإنشاء كلمة مرور جديدة لتسجيل الدخول',
            style: TextStyles.textStyle16SemiBold,
          ),
          SizedBox(height: 34),
          DefaultFormField(
            onSaved: (value) {},
            hintText: 'كلمة المرور',
            textInputType: TextInputType.visiblePassword,
            containsSuffix: true,
          ),
          SizedBox(height: 24),
          DefaultFormField(
            onSaved: (value) {},
            hintText: 'قم بتأكيد كلمىة المرور',
            textInputType: TextInputType.visiblePassword,
            containsSuffix: true,
          ),
          SizedBox(height: 24),
          CustomButton(onPressed: () {}, text: 'إنشاء كلمة مرور جديدة')
        ],
      ),
    );
  }
}
