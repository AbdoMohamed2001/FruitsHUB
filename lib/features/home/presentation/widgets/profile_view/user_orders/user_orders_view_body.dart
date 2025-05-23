import 'package:flutter/material.dart';

import 'order_deatils.dart';

class UserOrdersViewBody extends StatelessWidget {
  const UserOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            OrderDetails(),
            SizedBox(height: 8),
            OrderDetails(),
            SizedBox(height: 8),
            OrderDetails(),
          ],
        ),
      ),
    );
  }
}
