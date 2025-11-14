import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final bool isOperator;
  final bool isEqual;
  final bool isSpecial;
  final int flex;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onPressed;

  const CalculatorButton({
    super.key,
    required this.label,
    this.isOperator = false,
    this.isEqual = false,
    this.isSpecial = false,
    this.flex = 1,
    this.padding = const EdgeInsets.all(6),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor = isSpecial
        ? const Color(0xffff9500)
        : const Color(0xff2c2c2e);

    final double fontSize = isOperator ? 32 : 28;

    return Expanded(
      flex: flex,
      child: Padding(
        padding: padding,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(bgColor),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: 22),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(fontSize: fontSize, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
