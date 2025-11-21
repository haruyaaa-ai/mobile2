import 'package:flutter/material.dart';

class CartHomePage extends StatelessWidget {
  const CartHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Toko')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.store),
                label: const Text('Lihat Produk'),
                onPressed: () => Navigator.pushNamed(context, '/grid'),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Lihat Keranjang'),
                onPressed: () => Navigator.pushNamed(context, '/summary'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
