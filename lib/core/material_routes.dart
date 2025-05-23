import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_app/features/home/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:fruits_app/features/home/presentation/views/best_seeling_view.dart';
import 'package:fruits_app/features/home/presentation/views/main_view.dart';
import 'package:fruits_app/features/home/presentation/views/products_view.dart';
import 'package:fruits_app/features/home/presentation/views/rating_view.dart';
import 'package:fruits_app/features/home/presentation/views/search_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/personal_user_data/personal_user_data_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/user_favourite/user_favourite_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/user_orders/user_orders_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/user_payment/user_payment_view.dart';

import '../features/auth/presentation/forget_password/views/check_code.dart';
import '../features/auth/presentation/forget_password/views/forget_password.dart';
import '../features/auth/presentation/forget_password/views/new_password.dart';
import '../features/auth/presentation/login/views/login_view.dart';
import '../features/auth/presentation/register/views/register_view.dart';
import '../features/checkout/presentation/views/check_out_view.dart';
import '../features/home/presentation/views/cart_view.dart';
import '../features/home/presentation/views/profile_view.dart';
import '../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../features/product/presentation/views/product_details_view.dart';
import '../features/splash/presentation/views/splash_view.dart';
import 'entities/product_entity.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const SplashView());
    case '/on_boarding':
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case '/login':
      return MaterialPageRoute(builder: (_) => const LoginView());
    case '/register':
      return MaterialPageRoute(builder: (_) => const RegisterView());
    case '/forget':
      return MaterialPageRoute(builder: (_) => const ForgetPassword());
    case '/check':
      return MaterialPageRoute(builder: (_) => const CheckCode());
    case '/new_password':
      return MaterialPageRoute(builder: (_) => const NewPassword());
    case '/home':
      return MaterialPageRoute(builder: (_) => const MainView());
    case '/search':
      final productsCubit = settings.arguments as ProductsCubit;
      return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
                value: productsCubit,
                child: const SearchView(),
              ));
    case '/products':
      return MaterialPageRoute(builder: (_) => const ProductsView());
    case '/cart':
      return MaterialPageRoute(builder: (_) => const CartView());
    case '/profile':
      return MaterialPageRoute(builder: (_) => const ProfileView());
    case '/best_sealing':
      final productsCubit = settings.arguments as ProductsCubit;
      return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
                value: productsCubit,
                child: const BestSealingView(),
              ));
    case '/personal_user_data':
      final profileCubit = settings.arguments as ProfileCubit;
      return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
                value: profileCubit,
                child: const PersonalUserDataView(),
              ));
    case '/orders':
      return MaterialPageRoute(builder: (_) => const UserOrdersView());
    case '/payments':
      return MaterialPageRoute(builder: (_) => const UserPaymentView());
    case '/favourites':
      final productsCubit = settings.arguments as ProductsCubit;
      return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
                value: productsCubit,
                child: const UserFavouriteView(),
              ));
    case '/check_out':
      return MaterialPageRoute(builder: (_) => const CheckOutView());
    case '/rating':
      final productEntity = settings.arguments as ProductEntity;
      return MaterialPageRoute(
          builder: (_) => RatingView(productEntity: productEntity));

    case '/product_details':
      final args = settings.arguments as Map;
      final productEntity = args['product'] as ProductEntity;
      final cartCubit = args['cartCubit'] as CartCubit;
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: cartCubit,
          child: ProductDetailsView(productEntity: productEntity),
        ),
      );
    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}
