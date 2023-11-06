import 'package:block_sample/featurs/home/bloc/home_bloc.dart';
import 'package:block_sample/featurs/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductModel product;
  final HomeBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.product, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(product.imageUrl), fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            product.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(product.discription),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$: ${product.price.toString()}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductWishlistButtonClickEvent(
                            clickedProduct: product));
                      },
                      icon: const Icon(Icons.favorite_border,
                          color: Colors.black)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartButtonClickEvent(
                            clickedProduct: product));
                      },
                      icon: const Icon(Icons.add_shopping_cart_rounded,
                          color: Colors.black))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
