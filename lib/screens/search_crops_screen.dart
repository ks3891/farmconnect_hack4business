import 'package:flutter/material.dart';
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
      appBar: AppBar(title: const Text("Search Crops")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search crop',
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
    'Tomato', 'Potato', 'Onion', 'Carrot', 'Cabbage', 'Spinach',
    'Cauliflower', 'Chili', 'Pumpkin', 'Cucumber', 'Beans'
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
      appBar: AppBar(title: const Text('Search Crops')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for crops...',
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
              const Text('Search Results', style: TextStyle(fontWeight: FontWeight.bold)),
              ...filteredCrops.map((crop) => ListTile(title: Text(crop))),
              const SizedBox(height: 16),
              const Text('You may also like', style: TextStyle(fontWeight: FontWeight.bold)),
              ...recommendedCrops.map((crop) => ListTile(title: Text(crop))),
            ]
          ],
        ),
      ),
    );
  }
}
