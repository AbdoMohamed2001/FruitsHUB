import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/home/presentation/widgets/best_selling_grid_view_builder.dart';

import '../../../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../../../core/utils/functions/stream_user_favourite.dart';

class UserFavouriteViewViewBody extends StatefulWidget {
  const UserFavouriteViewViewBody({super.key});

  @override
  State<UserFavouriteViewViewBody> createState() =>
      _UserFavouriteViewViewBodyState();
}

class _UserFavouriteViewViewBodyState extends State<UserFavouriteViewViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getUserFavouriteProducts();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return BestSellingGridViewBuilder(
                stream: streamUserFavourites(),
              );
            }),
      ],
    );
  }
}
