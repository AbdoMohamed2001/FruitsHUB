import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/home/presentation/cubits/profile_cubit/profile_cubit.dart';

import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/repos/products_repos/product_repo.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../auth/domain/repos/auth_repo.dart';
import '../widgets/main_view_body.dart';
import '../widgets/nav_bar/cutsom_botoom_nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        onTapped: (value) {
          setState(() {
            currentViewIndex = value;
          });
        },
      ),
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProfileCubit(getIt.get<AuthRepo>()),
            ),
            BlocProvider(
              create: (context) => ProductsCubit(getIt.get<ProductRepo>())
                ..loadCachedFavourites(),
            ),
          ],
          child: MainViewBody(currentViewIndex: currentViewIndex),
        ),
      ),
    );
  }
}
