import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import '../pages/cart_summary_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';

class ProductGridPage extends StatelessWidget {
  ProductGridPage({super.key});

  final List<ProductModel> products = [
    ProductModel(
      id: "1",
      name: "Ganti Oli",
      price: "75000",
      image: "assets/images/oli.jpg",
    ),
    ProductModel(
      id: "2",
      name: "Servis Rem",
      price: "120000",
      image: "assets/images/rem.jpg",
    ),
    ProductModel(
      id: "3",
      name: "Tune Up Motor",
      price: "150000",
      image: "assets/images/tuneup.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Bengkel Service Center"),
        backgroundColor: Colors.teal.shade600,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartSummaryPage()),
              );
            },
          ),
        ],
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
