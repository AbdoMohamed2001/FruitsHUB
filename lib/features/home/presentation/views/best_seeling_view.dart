import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/widgets/app_bar_with_notification.dart';
import '../widgets/best_sealing/best_sealing_view_body.dart';

class BestSealingView extends StatelessWidget {
  const BestSealingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithNotification(
          title: 'الأكثر مبيعًا', containsLeading: true),
      body: BestSealingViewBody(),
    );
  }
}
