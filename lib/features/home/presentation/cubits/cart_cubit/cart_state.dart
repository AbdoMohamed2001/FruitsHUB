part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartProductAddedSuccess extends CartState {}

final class CartProductAddedFailure extends CartState {}

final class CartItemRemovedSuccess extends CartState {}

final class CartItemRemovedFailure extends CartState {}

final class CartItemUpdated extends CartState {}
