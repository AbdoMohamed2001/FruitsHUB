import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constants.dart';
import 'package:fruits_app/core/utils/text_styles.dart';
import 'package:fruits_app/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/auth/presentation/forget_password/views/widgets/check_code_body.dart';

class CheckCode extends StatelessWidget {
  const CheckCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'التحقق من الرمز'),
      body: CheckCodeBody(),
    );
  }
}
