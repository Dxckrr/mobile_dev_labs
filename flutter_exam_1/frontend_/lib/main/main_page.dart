import 'package:flutter/material.dart';
import 'package:frontend_/main/item.dart';
import 'package:frontend_/services/auth/auth_service.dart';
import 'package:frontend_/services/db/database_service.dart';
import 'package:frontend_/services/items/items_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _itemsService = ItemsService();
  final _authService = AuthService();

  bool isGrid = false;

  List<dynamic> allItems = [];
  List<dynamic> visibleItems = [];

  bool showOnlyFavorites = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getItems(context);
    });
  }

  Future<void> _getItems(BuildContext context) async {
    final token = await _authService.getToken();
    if (token != null) {
      try {
        final apiItems = await _itemsService.fetchItems(token);

        await DatabaseService.instance.syncApiFavoritesToSQLite(apiItems);

        final localFavorites = await DatabaseService.instance.getFavorites();

        final merged = apiItems.map((item) {
          return {
            ...item,
            "is_favorite": localFavorites.contains(item['id']) ? 1 : 0,
          };
        }).toList();

        setState(() {
          allItems = merged;
          visibleItems = merged;
        });
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error fetching items: $e')));
      }
    }
  }

  void _refreshFavorites() async {
    final favorites = await DatabaseService.instance.getFavorites();

    setState(() {
      for (var item in allItems) {
        item["is_favorite"] = favorites.contains(item["id"]) ? 1 : 0;
      }
      if (showOnlyFavorites) {
        visibleItems = allItems.where((i) => i["is_favorite"] == 1).toList();
      } else {
        visibleItems = allItems;
      }
    });
  }

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

                IconButton(
                  icon: Icon(
                    Icons.star,
                    color: showOnlyFavorites ? Colors.amber : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      showOnlyFavorites = !showOnlyFavorites;

                      if (showOnlyFavorites) {
                        visibleItems = allItems
                            .where((item) => item["is_favorite"] == 1)
                            .toList();
                      } else {
                        visibleItems = allItems;
                      }
                    });
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: isGrid
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                    itemCount: visibleItems.length,
                    itemBuilder: (context, index) {
                      final item = visibleItems[index];
                      return Item(
                        id: item['id'],
                        image: item['img_url'],
                        name: item['name'],
                        seller: item['seller'],
                        rating: item['rating'],
                        isFavorite: item['is_favorite'] == 1,
                        isGrid: isGrid,
                        onChanged: _refreshFavorites,
                      );
                    },
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: visibleItems.length,
                    itemBuilder: (context, index) {
                      final item = visibleItems[index];
                      return Item(
                        id: item['id'],
                        image: item['img_url'],
                        name: item['name'],
                        seller: item['seller'],
                        rating: item['rating'],
                        isFavorite: item['is_favorite'] == 1,
                        isGrid: isGrid,
                        onChanged: _refreshFavorites,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
