part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveItemEvent extends CartEvent {
  final ProductModel deletedProduct;

  CartRemoveItemEvent({required this.deletedProduct});
}
