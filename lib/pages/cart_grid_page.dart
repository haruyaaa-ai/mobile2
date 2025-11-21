import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';

class ProductGridPage extends StatelessWidget {
  ProductGridPage({super.key});

  final List<ProductModel> products = [
    ProductModel(
      id: "1",
      name: "Kopi Latte",
      price: "25000",
      image: "https://i.imgur.com/1ZQZ1.jpg",
    ),
    ProductModel(
      id: "2",
      name: "Mochaccino",
      price: "28000",
      image: "https://i.imgur.com/2ZZ22.jpg",
    ),
    ProductModel(
      id: "3",
      name: "Matcha Latte",
      price: "30000",
      image: "https://i.imgur.com/3XX33.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Aesthetic Store"),
        backgroundColor: Colors.teal.shade400,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.72,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: products.length,
        itemBuilder: (context, i) {
          return ProductCard(product: products[i]);
        },
      ),
    );
  }
}
