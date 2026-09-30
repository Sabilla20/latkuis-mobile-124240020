import 'package:flutter/material.dart';

import '../data/data.dart';
import '../widgets/menu_image.dart';

class DetailPage extends StatelessWidget {
  final Menu menu;

  const DetailPage({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(menu.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          MenuImage(
            url: menu.image,
            width: double.infinity,
            height: 220,
            radius: 16,
          ),
          const SizedBox(height: 16),
          Text(
            menu.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(menu.category, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),
          Text(
            menu.price,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Deskripsi',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(menu.description, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
