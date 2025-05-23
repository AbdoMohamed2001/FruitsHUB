import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:fruits_app/features/checkout/presentation/widgets/step_pages/check_out_page_view.dart';
import 'package:fruits_app/features/checkout/presentation/widgets/step_items/check_out_steps.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          CheckOutSteps(),
          SizedBox(height: 32),
          CheckOutPageView(
            pageController: pageController,
          ),
          CustomButton(
            onPressed: () {},
            text: 'التالى',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.178,
          ),
        ],
      ),
    );
  }
}
