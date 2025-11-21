import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';

class CartSummaryPage extends StatelessWidget {
  const CartSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartCubit>();
    final items = cart.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Bengkel"),
        backgroundColor: Colors.teal,
      ),
      body: items.isEmpty
          ? const Center(child: Text("Keranjang masih kosong"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      final item = items[i];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          leading: Image.network(item.product.image, width: 50),
                          title: Text(item.product.name),
                          subtitle: Text(
                            "Rp ${item.product.price} x ${item.qty}",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  final newQty = item.qty - 1;
                                  context.read<CartCubit>().removeFromCart(
                                    item.product,
                                    newQty,
                                  );
                                },
                              ),
                              Text("${item.qty}"),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  context.read<CartCubit>().addToCart(
                                    item.product,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // TOTAL
                Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.teal.shade50,
                  child: Column(
                    children: [
                      Text(
                        "Total Items: ${cart.getTotalItems()}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Total Harga: Rp ${cart.getTotalPrice()}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CartCubit>().clearCart();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Checkout"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
