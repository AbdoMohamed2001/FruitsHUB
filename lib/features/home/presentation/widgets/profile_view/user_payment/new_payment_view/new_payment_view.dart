import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/widgets/custom_app_bar.dart';

import 'new_payment_view_body.dart';

class NewPaymentView extends StatelessWidget {
  const NewPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'اضافه بطاقه جديده'),
      body: NewPaymentViewBody(),
    );
  }
}
