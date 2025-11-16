import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  final TextEditingController controller;

  const CalculatorScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      alignment: Alignment.bottomRight,
      child: TextField(
        controller: controller,
        readOnly: true,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.lightGreen.shade400,
          hintText: '0',
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
