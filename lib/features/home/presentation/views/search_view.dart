import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/services/database_services.dart';
import 'package:fruits_app/core/services/get_it_services_locator.dart';
import 'package:fruits_app/core/utils/widgets/app_bar_with_notification.dart';
import 'package:fruits_app/features/home/presentation/cubits/search_cubit/search_cubit.dart';

import '../widgets/search_view/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<DatabaseServices>()),
      child: Scaffold(
        appBar: CustomAppBarWithNotification(
          title: 'البحث',
          containsLeading: true,
        ),
        body: SearchViewBody(),
      ),
    );
  }
}
