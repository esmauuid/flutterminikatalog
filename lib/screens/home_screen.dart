import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/banner_card.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<Product> products;
  final int cartCount;
  final void Function(Product product) onAddToCart;

  const HomeScreen({
    super.key,
    required this.products,
    required this.cartCount,
    required this.onAddToCart,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = '';
  String selectedCategory = 'Tümü';

  List<String> get categories {
    final categorySet = widget.products.map((product) => product.category).toSet().toList();
    return ['Tümü', ...categorySet];
  }

  List<Product> get filteredProducts {
    return widget.products.where((product) {
      final matchesSearch = product.title.toLowerCase().contains(searchText.toLowerCase());
      final matchesCategory = selectedCategory == 'Tümü' || product.category == selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  void goToDetail(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(
          product: product,
          onAddToCart: widget.onAddToCart,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mini Katalog',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Badge(
              label: Text(widget.cartCount.toString()),
              child: const Icon(Icons.shopping_bag_outlined),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BannerCard(),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Ürün ara...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 42,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = selectedCategory == category;
                    return ChoiceChip(
                      selected: isSelected,
                      label: Text(category),
                      onSelected: (_) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Ürünler (${filteredProducts.length})',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                  itemCount: filteredProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 14,
                    childAspectRatio: 0.56,
                  ),
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return ProductCard(
                      product: product,
                      onTap: () => goToDetail(product),
                      onAddToCart: () => widget.onAddToCart(product),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
