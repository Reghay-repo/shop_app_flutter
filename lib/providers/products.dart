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
