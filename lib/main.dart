import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/user_products_screen.dart';

import './screens//products_overview_screen.dart';
import './screens//product_details_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                primary: Colors.purple,
                secondary: Colors.deepOrange),
            useMaterial3: true,
          ),
          home: const ProductsOverviewScreen(),
          routes: {
            EditProductScreen.routeName: (ctx) => const EditProductScreen(),
            UserProductsScreen.namedRoute: (ctx) => const UserProductsScreen(),
            ProductDetailsScreen.routeName: (ctx) =>
                const ProductDetailsScreen(),
            CartScreen.routeName: (ctx) => const CartScreen(),
            OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          }),
    );
  }
}
