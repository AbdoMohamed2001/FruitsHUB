import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/text_styles.dart';
import 'package:fruits_app/core/utils/widgets/custom_search_bar.dart';
import 'package:fruits_app/features/home/presentation/widgets/best_selling_grid_view.dart';
import 'package:fruits_app/generated/assets.dart';

import '../../cubits/search_cubit/search_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff000000).withValues(alpha: 0.04),
                        blurRadius: 9,
                        offset: Offset(0, 2),
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: CustomSearchBar(
                    enabled: true,
                  ),
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (context.read<SearchCubit>().searchResults.isEmpty) {
              if (state is SearchLoading) {
                return SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 70),
                      Center(child: CircularProgressIndicator()),
                    ],
                  ),
                );
              }
              return SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff000000).withValues(alpha: 0.06),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 46.0, vertical: 12),
                          child: Text(
                            'لاتوجد نتائج بحث',
                            style: TextStyles.textStyle13SemiBold.copyWith(
                              color: Color(0xff949D9E),
                              height: 160 / 100,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                    Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(Assets.imagesNoResult2),
                        Text(
                          'البحث',
                          style: TextStyles.textStyle16Bold.copyWith(
                            color: Color(0xff616A6B),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'عفوًا... هذه المعلومات غير متوفرة للحظة',
                          style: TextStyles.textStyle13SemiBold.copyWith(
                            color: Color(0xff949D9E),
                            height: 160 / 100,
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              );
            } else {
              if (state is SearchFailure) {
                return Column(
                  children: [
                    SizedBox(height: 60),
                    Text(state.message),
                  ],
                );
              } else if (state is SearchSuccess) {
                return BestSellingGridView(
                    products: context.read<SearchCubit>().searchResults);
              }
              return SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 70),
                    Center(child: CircularProgressIndicator()),
                  ],
                ),
              );
            }
          },
        )
      ],
    );
  }
}
