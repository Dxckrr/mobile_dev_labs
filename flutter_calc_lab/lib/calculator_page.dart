import 'package:flutter/material.dart';
import 'package:flutter_calc_lab/calculator_screen.dart';
import 'calculator_button.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 190, 190, 197),
      body: Column(
        children: [
          const Expanded(flex: 2, child: CalculatorScreen()),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(child: createRow(["AC", "CE", "%"])),
                        Expanded(child: createRow(["7", "8", "9"])),
                        Expanded(child: createRow(["4", "5", "6"])),
                        Expanded(child: createRow(["1", "2", "3"])),
                        Expanded(child: createRow(["0", ".", "="])),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CalculatorButton(
                          label: "÷",
                          isOperator: true,
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 2,
                          ),
                        ),
                        CalculatorButton(
                          label: "x",
                          isOperator: true,
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 2,
                          ),
                        ),
                        CalculatorButton(
                          label: "-",
                          isOperator: true,
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 2,
                          ),
                        ),

                        CalculatorButton(
                          label: "+",
                          isOperator: true,
                          flex: 2,
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createRow(List<String> labels) {
    return Row(
      children: labels.map((label) {
        final isSpecial = ["AC", "CE"].contains(label);

        return CalculatorButton(label: label, isSpecial: isSpecial);
      }).toList(),
    );
  }
}
