import 'package:flutter/material.dart';

import 'data/product_data.dart';
import 'models/product.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MiniCatalogApp());
}

class MiniCatalogApp extends StatefulWidget {
  const MiniCatalogApp({super.key});

  @override
  State<MiniCatalogApp> createState() => _MiniCatalogAppState();
}

class _MiniCatalogAppState extends State<MiniCatalogApp> {
  int cartCount = 0;

  void addToCart(Product product) {
    setState(() {
      cartCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Katalog',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          primary: const Color(0xFF2563EB),
          secondary: const Color(0xFFF97316),
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F8FB),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6F8FB),
          elevation: 0,
          centerTitle: false,
        ),
      ),
      home: HomeScreen(
        products: getDemoProducts(),
        cartCount: cartCount,
        onAddToCart: addToCart,
      ),
    );
  }
}
