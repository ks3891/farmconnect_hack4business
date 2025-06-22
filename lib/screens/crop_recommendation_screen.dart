import 'package:flutter/material.dart';

class CropRecommendationScreen extends StatefulWidget {
  const CropRecommendationScreen({super.key});

  @override
  State<CropRecommendationScreen> createState() => _CropRecommendationScreenState();
}

class _CropRecommendationScreenState extends State<CropRecommendationScreen> {
  String? _selectedRegion;

  final Map<String, List<Map<String, dynamic>>> regionData = {
    'Terai': [
    {
      'name': 'काउली',
      'price': 'Rs. 45/kg',
      'image': 'https://t4.ftcdn.net/jpg/00/55/94/57/360_F_55945753_8WOxMob7kAsVeXUMfSVauDzE4DIjbLxZ.jpg',
      'farmer': 'Ram Yadav'
    },
    {
      'name': 'आलु',
      'price': 'Rs. 30/kg',
      'image': 'https://www.kew.org/sites/default/files/styles/original/public/2025-01/many-potatoes-solanum-tuberosum.jpg.webp?itok=RhcGjOE3',
      'farmer': 'Sita Chaudhary'
    },
  ],
  'Hill': [
    {
      'name': 'टमाटर',
      'price': 'Rs. 50/kg',
      'image': 'https://farmpays.com/wp-content/w3-webp/uploads/2023/01/paipai-1.jpgw3.webp',
      'farmer': 'Kiran Rai'
    },
    {
      'name': 'साग',
      'price': 'Rs. 25/kg',
      'image': 'https://www.greendna.in/cdn/shop/products/English_Spinach__67562.jpg?v=1607938113',
      'farmer': 'Bimala Gurung'
    },
  ],
  'Mountain': [
    {
      'name': 'स्याउ',
      'price': 'Rs. 100/kg',
      'image': 'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?w=400',
      'farmer': 'Tashi Lama'
    },
    {
      'name': 'किवी',
      'price': 'Rs. 120/kg',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiT-eIiyhqA_TMYBSe41GfeqNOEfmYkba8LA&s',
      'farmer': 'Sonam Sherpa'
    },
  ],
};

  @override
  Widget build(BuildContext context) {
    final crops = _selectedRegion != null ? regionData[_selectedRegion!]! : [];

    return Scaffold(
      appBar: AppBar(title: const Text("Regional Crop Recommendations")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedRegion,
              isExpanded: true,
              hint: const Text('Select your region'),
              items: regionData.keys.map((region) {
                return DropdownMenuItem(
                  value: region,
                  child: Text(region),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => _selectedRegion = value);
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: crops.isEmpty
                  ? const Text('No crops to show. Select a region.')
                  : ListView.builder(
                      itemCount: crops.length,
                      itemBuilder: (context, index) {
                        final crop = crops[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                crop['image'],
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                              ),
                            ),
                            title: Text(crop['name'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Price: ${crop['price']}'),
                                Text('Farmer: ${crop['farmer']}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
