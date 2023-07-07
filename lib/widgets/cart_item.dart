import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final String producId;
  final double price;
  final int quantity;
  const CartItem({
    Key? key,
    required this.id,
    required this.title,
    required this.producId,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
          padding: const EdgeInsets.only(right: 20),
          alignment: Alignment.centerRight,
          color: Theme.of(context).colorScheme.secondary,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          )),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(id);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(child: Text(' \$ $price ')),
          ),
          title: Text(title),
          subtitle: Text('Total  \$ ${quantity * price}'),
          trailing: Text('$quantity X'),
        ),
      ),
    );
  }
}
