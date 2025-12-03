import 'package:flutter/material.dart';

class ThirdView extends StatelessWidget {
  final String color;
  const ThirdView({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Third View')),
      body: Center(child: Text('Color seleccionado: $color')),
    );
  }
}
