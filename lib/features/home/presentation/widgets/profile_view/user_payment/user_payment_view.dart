import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/user_payment/user_payment_body.dart';

class UserPaymentView extends StatelessWidget {
  const UserPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'المدفوعات',
      ),
      body: SafeArea(child: UserPaymentBody()),
    );
  }
}
