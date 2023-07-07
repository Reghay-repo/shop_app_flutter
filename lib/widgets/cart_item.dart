import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;
  const CartItem({
    Key? key,
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          child: FittedBox(child: Text(' \$ ${price} ')),
        ),
        title: Text(title),
        subtitle: Text('Total  \$ ${quantity * price}'),
        trailing: Text('$quantity X'),
      ),
    );
  }
}
