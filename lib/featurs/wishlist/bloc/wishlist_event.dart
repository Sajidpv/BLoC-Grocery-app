part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveItemEvent extends WishlistEvent {
  final ProductModel removedProduct;

  WishlistRemoveItemEvent({required this.removedProduct});
}
