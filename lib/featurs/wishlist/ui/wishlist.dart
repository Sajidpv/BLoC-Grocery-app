import 'package:block_sample/featurs/home/bloc/home_bloc.dart';
import 'package:block_sample/featurs/wishlist/bloc/wishlist_bloc.dart';
import 'package:block_sample/featurs/wishlist/ui/wishlist_tile_items.dart';
import 'package:block_sample/globals/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: AppStyles.whiteText(),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          if (state is WishlistItemRemovedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Item removed from Wishlist')));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(
                      product: successState.wishlistItems[index],
                      wishlistBloc: wishlistBloc,
                      homeBloc: homeBloc,
                    );
                  });
            case WishlistLoadingState:
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
