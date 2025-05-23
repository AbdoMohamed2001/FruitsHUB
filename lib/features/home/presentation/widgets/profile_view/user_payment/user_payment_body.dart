import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class UserPaymentBody extends StatelessWidget {
  const UserPaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          TextField(),
          SizedBox(height: 16),
          TextField(),
          Spacer(),
          CustomButton(
            onPressed: () {
              context.push('/new_payment');
            },
            text: '+ أضف وسيلة دفع جديده ',
          ),
          SizedBox(height: 110),
        ],
      ),
    );
  }
}
