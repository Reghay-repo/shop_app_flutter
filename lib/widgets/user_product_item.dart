import 'package:flutter/material.dart';
import 'package:shop_app/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const UserProductItem(
      {Key? key,
      required this.image,
      required this.description,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(backgroundImage: NetworkImage(image)),
      // subtitle: Text('${description.substring(0, description.length - 5)}...'),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
            onPressed: () {},
            color: Colors.red,
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, EditProductScreen.routeName);
            },
            color: Colors.purple,
            icon: const Icon(Icons.edit),
          ),
        ]),
      ),
      onTap: () {
        print('taped');
      },
    );
  }
}
