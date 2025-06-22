import 'package:flutter/material.dart';

class SustainabilitySettingsScreen extends StatefulWidget {
  const SustainabilitySettingsScreen({super.key});

  @override
  State<SustainabilitySettingsScreen> createState() =>
      _SustainabilitySettingsScreenState();
}

class _SustainabilitySettingsScreenState
    extends State<SustainabilitySettingsScreen> {
  bool organicFarming = false;
  bool waterConservation = false;
  bool renewableEnergy = false;

  void saveSettings() {
    // Here you can add actual save logic if needed.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sustainable Practices Updated')),
    );
    Navigator.pop(context); // Go back after saving
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sustainability Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text('Organic Farming'),
              value: organicFarming,
              onChanged: (bool? value) {
                setState(() {
                  organicFarming = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Water Conservation'),
              value: waterConservation,
              onChanged: (bool? value) {
                setState(() {
                  waterConservation = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Renewable Energy Usage'),
              value: renewableEnergy,
              onChanged: (bool? value) {
                setState(() {
                  renewableEnergy = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveSettings,
              child: const Text('Save Sustainable Practices'),
            ),
          ],
        ),
      ),
    );
  }
}
