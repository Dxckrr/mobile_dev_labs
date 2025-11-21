import 'package:flutter/material.dart';
import 'package:flutter_list_app/Item_user.dart';

List<Map<String, dynamic>> aItems = [
  {
    'name': 'Christian',
    'program': 'Informatica',
    'averageScore': 89,
    'image': 'assets/chris.jpeg',
  },
  {
    'name': 'Jose',
    'program': 'Matematicas',
    'averageScore': 92,
    'image': 'assets/jose.jpeg',
  },
  {
    'name': 'Carvajal',
    'program': 'Fisica',
    'averageScore': 85,
    'image': 'assets/carvajal.png',
  },
  {
    'name': 'Patiño',
    'program': 'Negocios internacionales',
    'averageScore': 100,
    'image': 'assets/yo.jpeg',
  },
];

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  List<ItemUser> get awItems => _initializeItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List App!', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: ListView(children: awItems),
    );
  }

  List<ItemUser> _initializeItems() {
    List<ItemUser> items = [];
    for (var item in aItems) {
      items.add(
        ItemUser(
          image: item['image'],
          name: item['name'],
          program: item['program'],
          averageScore: item['averageScore'],
        ),
      );
    }
    return items;
  }
}
