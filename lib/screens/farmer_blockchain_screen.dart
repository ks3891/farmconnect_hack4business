import 'package:flutter/material.dart';

class FarmerBlockchainScreen extends StatelessWidget {
  const FarmerBlockchainScreen({super.key});

  final List<Map<String, String>> mockTransactions = const [
    {
      "crop": "Tomato",
      "buyer": "Krishna Traders",
      "quantity": "100 kg",
      "price": "Rs. 30/kg",
      "hash": "0xABCD1234EF567890...",
      "status": "Verified"
    },
    {
      "crop": "Potato",
      "buyer": "AgroMart",
      "quantity": "50 kg",
      "price": "Rs. 25/kg",
      "hash": "0x98AF4321BCDE0001...",
      "status": "Verified"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blockchain Records"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: mockTransactions.length,
        itemBuilder: (context, index) {
          final tx = mockTransactions[index];
          return Card(
            margin: const EdgeInsets.all(12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Crop: ${tx["crop"]}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("Buyer: ${tx["buyer"]}"),
                  Text("Quantity: ${tx["quantity"]}"),
                  Text("Price: ${tx["price"]}"),
                  const SizedBox(height: 8),
                  Text("Transaction Hash: ${tx["hash"]}", style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.verified, color: Colors.green, size: 18),
                      const SizedBox(width: 4),
                      Text(tx["status"]!, style: const TextStyle(color: Colors.green)),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          // Optional: Open PolygonScan
                        },
                        child: const Text("View on Blockchain"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
