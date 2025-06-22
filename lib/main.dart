import 'package:flutter/material.dart';

// Shared Screens
import 'screens/login_screen.dart';
import 'screens/create_account_screen.dart';

// Farmer Screens
import 'screens/farmer_dashboard.dart';
import 'screens/farmer_profile_screen.dart';
import 'screens/add_crop_screen.dart';
import 'screens/my_crops_screen.dart';
import 'screens/farmer_order_screen.dart';
import 'screens/sustainability_settings_screen.dart'; // ✅ Added

// Admin Screens
import 'screens/admin_dashboard.dart';
import 'screens/manage_users_screen.dart';
import 'screens/crops_overview_screen.dart';
import 'screens/admin_reports_screen.dart';

// Buyer Screens
import 'screens/buyer_dashboard.dart';
import 'screens/browse_crops_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/order_history_screen.dart';
import 'screens/buyer_profile_screen.dart';
import 'screens/farmer_detail_screen.dart';

void main() {
  runApp(const FarmConnectApp());
}

class FarmConnectApp extends StatefulWidget {
  const FarmConnectApp({super.key});

  @override
  State<FarmConnectApp> createState() => _FarmConnectAppState();
}

class _FarmConnectAppState extends State<FarmConnectApp> {
  final String currentFarmerName = 'Demo Farmer';
  final List<Map<String, dynamic>> _allCrops = [];
  final List<Map<String, dynamic>> _buyerCart = [];

  void _addCrop(Map<String, dynamic> crop) {
    setState(() {
      _allCrops.add({...crop, 'farmerName': currentFarmerName});
    });
  }

  List<Map<String, dynamic>> get _myCrops {
    return _allCrops
        .where((crop) => crop['farmerName'] == currentFarmerName)
        .toList();
  }

  void _addToCart(Map<String, dynamic> crop) {
    setState(() {
      _buyerCart.add(crop);
    });
  }

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
        '/create-account': (context) => const CreateAccountScreen(),

        // Farmer Routes
        '/farmer': (context) => FarmerDashboard(
          farmerName: currentFarmerName,
          onAddCropTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddCropScreen(onAddCrop: _addCrop),
              ),
            );
          },
          onMyCropsTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => MyCropsScreen(crops: _myCrops)),
            );
          },
        ),
        '/farmer/profile': (context) => FarmerProfileScreen(
          name: currentFarmerName,
          email: "demo@example.com",
          phone: "9800000000",
          location: "Kathmandu",
          crops: "Tomato, Cabbage",
        ),
        '/farmer/orders': (context) => const FarmerOrderScreen(),

        // Admin Routes
        '/admin': (context) => const AdminDashboard(),
        '/admin/users': (context) => const ManageUsersScreen(),
        '/admin/crops': (context) => const CropsOverviewScreen(),
        '/admin/reports': (context) => const AdminReportsScreen(),

        // Buyer Routes
        '/buyer': (context) => const BuyerDashboard(),
        '/buyer/browse': (context) =>
            BrowseCropsScreen(crops: _allCrops, onAddToCart: _addToCart),
        '/buyer/cart': (context) => MyCartScreen(cartItems: _buyerCart),
        '/buyer/order-history': (context) => const OrderHistoryScreen(),
        '/buyer/profile': (context) => const BuyerProfileScreen(),

        // ✅ New Sustainability Settings Route
        '/sustainability-settings': (context) =>
            const SustainabilitySettingsScreen(),
      },
    );
  }
}
