import 'package:frontend_/main/item.dart';

class ListHelper {
  List<Item> initializeItems(bool isGrid, aItems) {
    List<Item> items = [];

    for (var item in aItems) {
      items.add(
        Item(
          image: item['image'],
          name: item['name'],
          seller: item['seller'],
          rating: item['rating'].toDouble(),
          isFavorite: item['isFavorite'],
          isGrid: isGrid,
        ),
      );
    }

    return items;
  }
}
