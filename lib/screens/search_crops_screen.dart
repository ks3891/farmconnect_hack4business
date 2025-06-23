import 'package:flutter/material.dart';
import '../widgets/voice_input_widget.dart';

class SearchCropScreen extends StatefulWidget {
  const SearchCropScreen({super.key});

  @override
  State<SearchCropScreen> createState() => _SearchCropScreenState();
}

class _SearchCropScreenState extends State<SearchCropScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _handleVoiceInput(String text) {
    setState(() {
      _searchController.text = text;
      // You can also trigger search logic here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("बाली खोज्नुहोस्")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'बाली खोज्नुहोस्',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            VoiceInputWidget(onResult: _handleVoiceInput),
          ],
        ),
      ),
    );
  }
}

class SearchCropsScreen extends StatefulWidget {
  const SearchCropsScreen({super.key});

  @override
  State<SearchCropsScreen> createState() => _SearchCropsScreenState();
}

class _SearchCropsScreenState extends State<SearchCropsScreen> {
  final List<String> allCrops = [
    'गोलभेंडा', 'आलु', 'प्याज', 'गाजर', 'बन्दा', 'पालुङ्गो',
    'काउली', 'खुर्सानी', 'फर्सी', 'काक्रो', 'सिमी'
  ];

  String searchQuery = '';
  List<String> get filteredCrops {
    if (searchQuery.isEmpty) return [];
    return allCrops.where((crop) =>
      crop.toLowerCase().contains(searchQuery.toLowerCase())
    ).toList();
  }

  List<String> get recommendedCrops {
    if (searchQuery.isEmpty) return [];
    return allCrops.where((crop) =>
      crop.toLowerCase().startsWith(searchQuery.toLowerCase()[0])
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('बाली खोज्नुहोस्')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'बाली खोज्नुहोस्...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 20),
            if (searchQuery.isNotEmpty) ...[
              const Text('खोज परिणाम', style: TextStyle(fontWeight: FontWeight.bold)),
              ...filteredCrops.map((crop) => ListTile(title: Text(crop))),
              const SizedBox(height: 16),
              const Text('तपाईंलाई यी पनि मनपर्न सक्छन्', style: TextStyle(fontWeight: FontWeight.bold)),
              ...recommendedCrops.map((crop) => ListTile(title: Text(crop))),
            ]
          ],
        ),
      ),
    );
  }
}