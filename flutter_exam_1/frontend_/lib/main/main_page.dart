import 'package:flutter/material.dart';
import 'package:frontend_/main/item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, dynamic>> aItems = [
    {
      "image": "assets/image_1.jpg",
      "name": "Organic Coffee",
      "seller": "Colombia Beans",
      "rating": 4.8,
      "isFavorite": true,
    },
    {
      "image": "assets/image_2.jpg",
      "name": "Wireless Headphones",
      "seller": "AudioMaster",
      "rating": 4.5,
      "isFavorite": false,
    },
    {
      "image": "assets/image_3.jpg",
      "name": "Smartwatch Pro",
      "seller": "TechCorp",
      "rating": 4.7,
      "isFavorite": true,
    },
  ];

  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(isGrid ? Icons.view_list : Icons.grid_view),
                  onPressed: () => setState(() => isGrid = !isGrid),
                ),
                IconButton(icon: const Icon(Icons.star), onPressed: () {}),
              ],
            ),
          ),

          // ---- MAIN CONTENT ----
          Expanded(
            child: isGrid
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                    itemCount: aItems.length,
                    itemBuilder: (context, index) {
                      final item = aItems[index];
                      return Item(
                        image: item['image'],
                        name: item['name'],
                        seller: item['seller'],
                        rating: item['rating'],
                        isFavorite: item['isFavorite'],
                        isGrid: isGrid,
                      );
                    },
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: aItems.length,
                    itemBuilder: (context, index) {
                      final item = aItems[index];
                      return Item(
                        image: item['image'],
                        name: item['name'],
                        seller: item['seller'],
                        rating: item['rating'],
                        isFavorite: item['isFavorite'],
                        isGrid: isGrid,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
