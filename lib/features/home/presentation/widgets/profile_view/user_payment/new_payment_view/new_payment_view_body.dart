import 'package:flutter/cupertino.dart';
import 'package:fruits_app/core/utils/widgets/custom_check_box.dart';
import 'package:fruits_app/core/utils/widgets/default_form_field.dart';

import '../../../../../../../core/utils/widgets/custom_button.dart';

class NewPaymentViewBody extends StatelessWidget {
  const NewPaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          SizedBox(height: 28),
          DefaultFormField(
            hintText: 'اسم حامل البطاقه',
            textInputType: TextInputType.text,
            containsSuffix: false,
            onSaved: (value) {},
          ),
          SizedBox(height: 8),
          DefaultFormField(
            hintText: 'رقم البطاقة',
            textInputType: TextInputType.text,
            containsSuffix: false,
            onSaved: (value) {},
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: DefaultFormField(
                  hintText: 'تاريخ الصلاحيه',
                  textInputType: TextInputType.datetime,
                  containsSuffix: false,
                  onSaved: (value) {},
                ),
              ),
              Expanded(
                child: DefaultFormField(
                  hintText: 'CVV',
                  textInputType: TextInputType.datetime,
                  containsSuffix: false,
                  onSaved: (value) {},
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          CustomCheckBox(
            isChecked: (value) {},
            text: 'جعل البطاقة افتراضية',
          ),
          Spacer(),
          CustomButton(
            text: '+ أضف وسيلة دفع جديده',
            onPressed: () {},
          ),
          SizedBox(height: 106),
        ],
      ),
    );
  }
}
