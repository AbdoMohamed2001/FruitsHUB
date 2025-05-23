import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_app/core/repos/products_repos/product_repo.dart';
import 'package:fruits_app/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/user_favourite/user_favourite_view_body.dart';

import '../../../../../../core/services/get_it_services_locator.dart';

class UserFavouriteView extends StatelessWidget {
  const UserFavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'المفضلة'),
      body: SafeArea(child: UserFavouriteViewViewBody()),
    );
  }
}
