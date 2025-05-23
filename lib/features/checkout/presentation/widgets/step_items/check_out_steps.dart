import 'package:flutter/material.dart';
import 'package:fruits_app/features/checkout/presentation/widgets/step_items/step_item.dart';

class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        getSteps().length,
        (index) => Expanded(
          child: StepItem(
            isActive: true,
            index: (index + 1).toString(),
            text: getSteps()[index],
          ),
        ),
      ),
    );
  }
}

List getSteps() {
  return ['الشحن', 'العنوان', 'الدفع', 'المراجعه'];
}
