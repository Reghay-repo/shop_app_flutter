import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/cart_badge.dart';
import 'package:shop_app/widgets/products_grid.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My shop'),
        actions: [
          Consumer<Cart>(
            builder: (_, cartStore, child) => MyBadge(
                color: Colors.blueAccent,
                value: cartStore.itemCount.toString(),
                top: 4,
                right: 6,
                child: IconButton(
                    icon: const Icon(Icons.shopping_bag),
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    })),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions option) {
              setState(() {
                if (option == FilterOptions.favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text('Only favorites'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Show all '),
              ),
            ],
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ProductsGrid(isFavorites: _showOnlyFavorites),
    );
  }
}
