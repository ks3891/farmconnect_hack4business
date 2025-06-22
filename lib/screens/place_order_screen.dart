import 'package:flutter/material.dart';
import '../utils/order_store.dart';

class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Place Order")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            OrderStore.addOrder({
              'crop': 'Tomatoes',
              'buyerName': 'Ram Bahadur',
              'quantity': '10kg',
              'status': 'Pending',
            });

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Order Placed")));
          },
          child: const Text("Place Order for Tomatoes"),
        ),
      ),
    );
  }
}
