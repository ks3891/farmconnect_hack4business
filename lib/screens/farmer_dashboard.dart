import 'package:flutter/material.dart';
import '../../widgets/common/sustainability_badge_display.dart';
import '../../services/sustainability_service.dart';

class FarmerDashboard extends StatelessWidget {
  final String farmerName;
  final VoidCallback onAddCropTap;
  final VoidCallback onMyCropsTap;

  const FarmerDashboard({
    super.key,
    required this.farmerName,
    required this.onAddCropTap,
    required this.onMyCropsTap,
  });

  @override
  Widget build(BuildContext context) {
    final int sustainabilityScore = 65;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildSustainabilityOverview(context, sustainabilityScore),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildDashboardCard(
                    icon: Icons.add_circle,
                    label: 'Add New Crops',
                    color: Colors.green,
                    onTap: onAddCropTap,
                  ),
                  _buildDashboardCard(
                    icon: Icons.list_alt,
                    label: 'My Crops',
                    color: Colors.orange,
                    onTap: onMyCropsTap,
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
          ],
        ),
      ),
    );
  }

  Widget _buildSustainabilityOverview(BuildContext context, int score) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Sustainability Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SustainabilityBadgeDisplay(
              sustainabilityScore: score,
              showScore: true,
              compact: false,
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sustainability-settings');
              },
              child: const Text('Update Sustainable Practices'),
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
