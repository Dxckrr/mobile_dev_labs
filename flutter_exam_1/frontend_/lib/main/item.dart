import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final String image;
  final String name;
  final String seller;
  final double rating;
  final bool isFavorite;
  final bool isGrid;

  const Item({
    super.key,
    required this.image,
    required this.name,
    required this.seller,
    required this.rating,
    this.isFavorite = false,
    this.isGrid = false,
  });

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  late bool isFavorite = widget.isFavorite;

  @override
  Widget build(BuildContext context) {
    // grid = item tipo tarjeta
    // list = item tipo fila horizontal

    return widget.isGrid
        ? Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image(
                    image: AssetImage(widget.image),
                    width: double.infinity,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.seller),
                Text('${widget.rating}'),
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: AssetImage(widget.image),
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(widget.seller),
                      Text('${widget.rating}'),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
