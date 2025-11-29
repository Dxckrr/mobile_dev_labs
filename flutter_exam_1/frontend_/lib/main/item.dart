import 'package:flutter/material.dart';
import 'package:frontend_/services/db/database_service.dart';

class Item extends StatelessWidget {
  final int id;
  final String image;
  final String name;
  final String seller;
  final String rating;
  final bool isFavorite;
  final bool isGrid;
  final VoidCallback? onChanged;

  const Item({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.seller,
    required this.rating,
    required this.isFavorite,
    this.isGrid = false,
    this.onChanged,
  });

  Future<void> _toggleFavorite() async {
    final db = DatabaseService.instance;

    if (isFavorite) {
      await db.removeFavorite(id);
    } else {
      await db.addFavorite(id);
    }

    if (onChanged != null) {
      onChanged!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteIcon = GestureDetector(
      onTap: _toggleFavorite,
      child: Icon(
        isFavorite ? Icons.star : Icons.star_border,
        color: isFavorite ? Colors.amber : Colors.grey,
      ),
    );

    return isGrid ? _buildGridItem(favoriteIcon) : _buildListItem(favoriteIcon);
  }

  Widget _buildGridItem(Widget favoriteIcon) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image(
              image: AssetImage(image),
              width: 300,
              height: 105,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(seller),
                  Text(rating),
                ],
              ),
              favoriteIcon,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(Widget favoriteIcon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: AssetImage(image),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(seller),
                Text(rating),
              ],
            ),
          ),
          favoriteIcon,
        ],
      ),
    );
  }
}
