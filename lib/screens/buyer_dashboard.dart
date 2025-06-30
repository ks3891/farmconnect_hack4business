import 'package:flutter/material.dart';
import 'chat_screen.dart'; // <-- Import ChatScreen (adjust path if needed)

class BuyerDashboard extends StatelessWidget {
  const BuyerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ग्राहक ड्यासबोर्ड'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          // NEW: Chat icon button added here
          IconButton(
            icon: const Icon(Icons.chat),
            tooltip: "च्याट खोल्नुहोस्",
            onPressed: () {
              // Replace 'Supplier XYZ' with actual supplier name if available
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ChatScreen(supplierName: 'Supplier XYZ'),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'स्वागत छ, क्रेता!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildDashboardCard(
              context,
              icon: Icons.shopping_bag,
              title: 'बालीहरू हेर्नुहोस्',
              subtitle: 'स्थानीय किसानबाट ताजा उत्पादन फेला पार्नुहोस्',
              onTap: () {
                Navigator.pushNamed(context, '/buyer/browse');
              },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.shopping_cart,
              title: 'मेरो कार्ट',
              subtitle: 'तपाईंले कार्टमा थप्नुभएका बालीहरू हेर्नुहोस्',
              onTap: () {
                Navigator.pushNamed(context, '/buyer/cart');
              },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.history,
              title: 'अर्डर इतिहास',
              subtitle: 'तपाईंका विगतका अर्डरहरू हेर्नुहोस्',
              onTap: () {
                Navigator.pushNamed(context, '/buyer/order-history');
              },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.person,
              title: 'प्रोफाइल',
              subtitle: 'आफ्नो प्रोफाइल जानकारी हेर्नुहोस् र सम्पादन गर्नुहोस्',
              onTap: () {
                Navigator.pushNamed(context, '/buyer/profile');
              },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.map,
              title: 'बाली सिफारिसहरू',
              subtitle: 'क्षेत्र अनुसार सुझावहरू प्राप्त गर्नुहोस्',
              onTap: () {
                Navigator.pushNamed(context, '/recommendations');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, size: 32, color: Colors.green.shade700),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
