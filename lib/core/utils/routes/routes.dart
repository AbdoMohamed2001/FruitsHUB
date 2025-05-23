import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fruits_app/features/checkout/presentation/views/check_out_view.dart';
import 'package:fruits_app/features/home/presentation/views/main_view.dart';
import 'package:fruits_app/features/home/presentation/views/notifications_view.dart';
import 'package:fruits_app/features/home/presentation/views/products_view.dart';
import 'package:fruits_app/features/home/presentation/views/profile_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/about_us/about_us_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/user_favourite/user_favourite_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/user_orders/user_orders_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/user_payment/new_payment_view/new_payment_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/user_payment/user_payment_view.dart';
import 'package:fruits_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_app/features/product/presentation/views/product_details_view.dart';
import 'package:fruits_app/features/splash/presentation/views/splash_view.dart';
import '../../../features/auth/presentation/forget_password/views/check_code.dart';
import '../../../features/auth/presentation/forget_password/views/forget_password.dart';
import '../../../features/auth/presentation/forget_password/views/new_password.dart';
import '../../../features/auth/presentation/login/views/login_view.dart';
import '../../../features/auth/presentation/register/views/register_view.dart';
import '../../../features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import '../../../features/home/presentation/views/cart_view.dart';
import '../../../features/home/presentation/widgets/home_view.dart';
import '../../../features/home/presentation/widgets/profile_view/personal_user_data/personal_user_data_view.dart';

import '../../entities/product_entity.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashView();
      },
    ),

    // ShellRoute wraps everything under /home in MainView + CartCubit
    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(
          create: (_) =>
              CartCubit(), // Provide CartCubit for MainView and all nested routes
          child: MainView(),
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) {
            return const HomeView();
          },
        ),
        GoRoute(
          path: '/product_details',
          builder: (context, state) {
            final productEntity = state.extra as ProductEntity;
            return ProductDetailsView(productEntity: productEntity);
          },
        ),
        GoRoute(
          path: '/cart',
          builder: (context, state) {
            return const CartView();
          },
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) {
            return const ProfileView();
          },
        ),
        GoRoute(
          path: '/check_out',
          builder: (context, state) {
            return const CheckOutView();
          },
        ),
      ],
    ),

    // Additional Routes (Login, Register, etc.)
    GoRoute(
      path: '/on_boarding',
      builder: (context, state) {
        return const OnBoardingView();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const LoginView();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) {
        return const RegisterView();
      },
    ),
    GoRoute(
      path: '/forget',
      builder: (context, state) {
        return const ForgetPassword();
      },
    ),
    GoRoute(
      path: '/check',
      builder: (context, state) {
        return const CheckCode();
      },
    ),
    GoRoute(
      path: '/new_password',
      builder: (context, state) {
        return const NewPassword();
      },
    ),
  ],
);
