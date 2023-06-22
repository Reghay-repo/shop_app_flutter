import 'package:flutter/material.dart';

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
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
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
            ProductDetailsScreen.routeName: (ctx) =>
                const ProductDetailsScreen(),
          }),
    );
  }
}
