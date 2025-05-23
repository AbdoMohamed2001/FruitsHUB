import 'package:flutter/material.dart';
import 'package:fruits_app/features/checkout/presentation/widgets/step_pages/shipping_section.dart';

class CheckOutPageView extends StatelessWidget {
  const CheckOutPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: getPages().length,
        itemBuilder: (_, i) => getPages()[i],
      ),
    );
  }

  List<Widget> getPages() {
    return [
      const ShippingSection(),
      SizedBox(),
      SizedBox(),
      SizedBox(),
    ];
  }
}
