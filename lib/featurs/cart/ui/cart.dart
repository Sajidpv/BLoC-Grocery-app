import 'package:block_sample/data/wishlist.dart';
import 'package:block_sample/featurs/cart/bloc/cart_bloc.dart';
import 'package:block_sample/featurs/cart/ui/cart_tile_widget.dart';
import 'package:block_sample/featurs/home/ui/product_tile_widget.dart';
import 'package:block_sample/featurs/wishlist/bloc/wishlist_bloc.dart';
import 'package:block_sample/globals/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    super.initState();
    cartBloc.add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart Items',
          style: AppStyles.whiteText(),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartItemRemovedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Item removed from Cart')));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 710,
                    child: ListView.builder(
                        itemCount: successState.cartItems.length,
                        itemBuilder: (context, index) {
                          return CartTileWidget(
                            product: successState.cartItems[index],
                            cartBloc: cartBloc,
                            wishlistBloc: wishlistBloc,
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedButton(
                        style: const ButtonStyle(),
                        onPressed: () {},
                        child: const Text('Check out')),
                  )
                ],
              );
            case CartLoadingState:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
