import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key? key}) : super(key: key);
  static const namedRoute = '/manage-products';
  @override
  Widget build(BuildContext context) {
    final productsStore = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your products '),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: productsStore.items.length,
          itemBuilder: (_, index) => UserProductItem(
              image: productsStore.items[index].imageUrl,
              description: productsStore.items[index].description,
              title: productsStore.items[index].title),
        ),
      ),
    );
  }
}
