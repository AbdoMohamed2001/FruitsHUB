import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/services/firebase_auth_services.dart';
import 'package:fruits_app/generated/assets.dart';

import '../../../../../core/services/shared_prefs_services.dart';
import '../../../../../core/utils/constants.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(
            Assets.imagesPlanet,
          ),
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          Assets.imagesCircles,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  executeNavigation() {
    Future.delayed(Duration(seconds: 3), () {
      if (Prefs.getBool(kIsOnBoardingSeen) == true) {
        FirebaseAuthService().isLoggedIn()
            ? Navigator.pushReplacementNamed(context, '/home')
            : Navigator.pushReplacementNamed(context, '/login');
      } else {
        Navigator.pushNamed(context, '/on_boarding');
      }
    });
  }
}
