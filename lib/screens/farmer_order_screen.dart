import 'package:flutter/material.dart';
import '../utils/order_store.dart'; // Make sure this path is correct

class FarmerOrderScreen extends StatelessWidget {
  const FarmerOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current orders from memory (no backend)
    final List<Map<String, dynamic>> orders = List.from(OrderStore.getOrders());

    return Scaffold(
      appBar: AppBar(title: const Text("Orders"), centerTitle: true),
      body: orders.isEmpty
          ? const Center(
              child: Text(
                "No orders have been placed yet.",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.shopping_cart,
                      color: Colors.green,
                    ),
                    title: Text(order['crop'] ?? ''),
                    subtitle: Text(
                      "Buyer: ${order['buyerName'] ?? ''}\n"
                      "Quantity: ${order['quantity'] ?? ''}\n"
                      "Status: ${order['status'] ?? ''}",
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Remove order from global store
                        OrderStore.removeOrderAt(index);
                        // Rebuild the screen by navigating back and forth
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                const FarmerOrderScreen(),
                            transitionDuration: Duration.zero,
                          ),
                        );
                      },
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
