import 'package:flutter/material.dart';

class ItemUser extends StatelessWidget {
  final String image;
  final String name;
  final String program;
  final int averageScore;

  const ItemUser({
    super.key,
    required this.image,
    required this.name,
    required this.program,
    required this.averageScore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Image(
            image: AssetImage(image),
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nombre: $name',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Carrera: $program', style: const TextStyle(fontSize: 18)),
              Text(
                'Promedio: $averageScore',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
