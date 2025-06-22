import 'package:flutter/material.dart';

class FarmerDashboard extends StatelessWidget {
  const FarmerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildDashboardCard(
              icon: Icons.add_circle,
              label: 'Add New Crops',
              color: Colors.green,
              onTap: () {
                Navigator.pushNamed(context, '/add-crop');
              },
            ),
            _buildDashboardCard(
              icon: Icons.list_alt,
              label: 'My Crops',
              color: Colors.orange,
              onTap: () {
                Navigator.pushNamed(context, '/my-crops');
              },
            ),
            _buildDashboardCard(
              icon: Icons.shopping_bag,
              label: 'Orders',
              color: Colors.blue,
              onTap: () {
                Navigator.pushNamed(context, '/farmer/orders');
              },
            ),
            _buildDashboardCard(
              icon: Icons.person,
              label: 'Profile',
              color: Colors.purple,
              onTap: () {
                Navigator.pushNamed(context, '/farmer/profile');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 10),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
