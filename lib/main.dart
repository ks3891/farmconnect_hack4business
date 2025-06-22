import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/farmer_dashboard.dart';
import 'screens/farmer_profile_screen.dart';
import 'screens/add_crop_screen.dart';
import 'screens/my_crops_screen.dart';
import 'screens/farmer_order_screen.dart';

void main() {
  runApp(const FarmConnectApp());
}

class FarmConnectApp extends StatelessWidget {
  const FarmConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmConnect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),

        // Farmer side routes
        '/farmer': (context) => const FarmerDashboard(),
        '/farmer/profile': (context) => const FarmerProfileScreen(
              name: "Demo Farmer",
              email: "demo@example.com",
              phone: "9800000000",
              location: "Kathmandu",
              crops: "Tomato, Cabbage",
            ),
        '/add-crop': (context) => const AddCropScreen(),
        '/my-crops': (context) => const MyCropsScreen(),
        '/farmer/orders': (context) => const FarmerOrderScreen(),

        // Buyer and Admin dashboards can be added similarly when ready
      },
    );
  }
}
