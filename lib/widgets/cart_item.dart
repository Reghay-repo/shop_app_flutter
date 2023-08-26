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
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: const Text('Yes, remove'),
              ),
            ],
            title: Text('Are you sure?'),
            content: Text('Do you want to remove the irem from Cart ?'),
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(producId);
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
