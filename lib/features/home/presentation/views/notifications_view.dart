import 'package:flutter/material.dart';

import '../widgets/notifications_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: NotificationViewBody()),
    );
  }
}
