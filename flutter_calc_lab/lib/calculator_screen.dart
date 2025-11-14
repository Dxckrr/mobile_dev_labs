import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      alignment: Alignment.bottomRight,
      child: TextField(
        readOnly: true,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: '0',
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white),
        ),
        style: const TextStyle(
          fontSize: 64,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
