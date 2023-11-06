import 'package:block_sample/featurs/cart/bloc/cart_bloc.dart';
import 'package:block_sample/featurs/home/bloc/home_bloc.dart';
import 'package:block_sample/featurs/home/models/home_product_data_model.dart';
import 'package:block_sample/featurs/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

class CartTileWidget extends StatelessWidget {
  final ProductModel product;
  final CartBloc cartBloc;
  final WishlistBloc wishlistBloc;
  const CartTileWidget(
      {super.key,
      required this.product,
      required this.cartBloc,
      required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 37,
            backgroundImage: AssetImage(product.imageUrl),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(product.discription),
              Row(
                children: [
                  Text(
                    '\$: ${product.price.toString()}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 140,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            wishlistBloc.add(WishlistRemoveItemEvent(
                                removedProduct: product));
                          },
                          icon:
                              const Icon(Icons.favorite, color: Colors.black)),
                      IconButton(
                          onPressed: () {
                            cartBloc.add(
                                CartRemoveItemEvent(deletedProduct: product));
                          },
                          icon: const Icon(Icons.delete, color: Colors.black))
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
