import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String supplierName;

  const ChatScreen({super.key, required this.supplierName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$supplierName सँग च्याट')),
      body: const Center(
        child: Text(
          'च्याट सुविधा चाँडै आउँदैछ!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}