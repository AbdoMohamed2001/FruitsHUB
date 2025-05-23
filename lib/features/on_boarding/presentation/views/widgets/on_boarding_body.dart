import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/constants.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:fruits_app/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

import '../../../../../core/services/shared_prefs_services.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnBoardingPageView(
          pageController: pageController,
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: currentPage == 0
                ? AppColors.kPrimary
                : AppColors.kPrimary.withOpacity(0.5),
            color: currentPage != 0
                ? AppColors.kPrimary
                : AppColors.kPrimary.withOpacity(0.5),
          ),
        ),
        SizedBox(height: 23),
        Visibility(
          visible: currentPage != 0 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(
              onPressed: () {
                Prefs.setBool(kIsOnBoardingSeen, true);
                Navigator.pushReplacementNamed(context, '/login');
              },
              text: 'ابدأ الان',
            ),
          ),
        ),
        SizedBox(height: 43),
      ],
    );
  }
}
