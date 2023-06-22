import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details';

  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    // get all data from that id
    final productsStore = Provider.of<Products>(context);
    final product = productsStore.findProductById(productId);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(product.title),
        ),
        body: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            const Text(
              'Description :',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.start,
            ),
            Text(product.description),
            Text('price :  ${product.price} \$'),
          ],
        ));
  }
}
