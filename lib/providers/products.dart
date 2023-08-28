import 'package:flutter/material.dart';
import "./product.dart";

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p5',
      title: 'pikala',
      description: 'pikala lil bay3.',
      price: 39.99,
      imageUrl:
          'https://images.pexels.com/photos/6038218/pexels-photo-6038218.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
    Product(
      id: 'p6',
      title: 'motor',
      description: 'motor lil bay3.',
      price: 70.99,
      imageUrl:
          'https://images.pexels.com/photos/5906795/pexels-photo-5906795.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
    Product(
      id: 'p7',
      title: 'channel bag',
      description: 'Ferragamo BOXYZ bag',
      price: 700.99,
      imageUrl:
          'https://images.unsplash.com/photo-1584917865442-de89df76afd3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1035&q=80',
    ),
    Product(
      id: 'p8',
      title: 'Necklace',
      description: 'FOLLOW MY WORK ON INSTAGRAM @iamthecho',
      price: 700.99,
      imageUrl:
          'https://images.unsplash.com/photo-1590548784585-643d2b9f2925?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1064&q=80',
    ),
    Product(
      id: 'p9',
      title: 'dining table',
      description: 'table for  4 people',
      price: 70.99,
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1661544747091-b629d1606c67?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80',
    ),
    Product(
      id: 'p10',
      title: 'champoo',
      description:
          'Baby Care Products | Newborn & Toddler Products Online | Johnson',
      price: 15.99,
      imageUrl:
          'https://www.johnsonsbaby.in/sites/jbaby_in/files/styles/medium/public/product-images/johnsons_blossom_baby_powder_200g.png',
    ),
    Product(
      id: 'p11',
      title: 'Canon camera',
      description: 'Products | Canon Australia',
      price: 15.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwKXrExPBPZJsGMVp3X_TMALZwC41G-qZvcQ&usqp=CAU',
    ),
    Product(
      id: 'p12',
      title: 'Apple VR headset',
      description: 'WWDC 2023: Apple launches Vision Pro & more new products',
      price: 15.99,
      imageUrl:
          'https://www.techrepublic.com/wp-content/uploads/2023/06/Apple-Vison-Pro-WWDC-2023.jpg',
    ),
  ];

  // var _showFavoritesOnly = false;
// getters

  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((product) => product.isFavorite == true).toList();
    // } else {
    return [..._items];
  }

  // void ShowOnlyFavorites() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void ShowAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Product findProductById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

// setters
  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
