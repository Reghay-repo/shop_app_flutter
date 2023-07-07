import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import '../widgets//cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartStore = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cart'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 10,
                ),
                FilledButton(onPressed: () {}, child: const Text('Order now')),
                Chip(
                    label:
                        Text('\$ ${cartStore.totalAmount.toStringAsFixed(2)}'))
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: cartStore.itemCount,
              itemBuilder: (ctx, i) => ci.CartItem(
                  id: cartStore.items.values.toList()[i].id,
                  producId: cartStore.items.keys.toList()[i],
                  price: cartStore.items.values.toList()[i].price,
                  quantity: cartStore.items.values.toList()[i].quantity,
                  title: cartStore.items.values.toList()[i].title)),
        )
      ]),
    );
  }
}
