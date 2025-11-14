import 'package:flutter/material.dart';
import 'package:flutter_calc_lab/calculator_screen.dart';

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
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(child: _buildNumberRow(["AC", "CE", "%"])),
                      Expanded(child: _buildNumberRow(["7", "8", "9"])),
                      Expanded(child: _buildNumberRow(["4", "5", "6"])),
                      Expanded(child: _buildNumberRow(["1", "2", "3"])),
                      Expanded(child: _buildNumberRow(["0", ".", "="])),
                    ],
                  ),
                ),

                // DERECHA
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(child: _buildOperatorButton("÷")),
                      Expanded(child: _buildOperatorButton("x")),
                      Expanded(child: _buildOperatorButton("-")),

                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(28),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffff9500),
                              padding: const EdgeInsets.all(0),
                            ),
                            child: const Text(
                              "+",
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberRow(List<String> nums) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: nums.map((n) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff2c2c2e),
                padding: const EdgeInsets.symmetric(vertical: 22),
              ),
              child: Text(
                n,
                style: const TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildOperatorButton(String op) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffff9500),
            padding: const EdgeInsets.symmetric(vertical: 22),
          ),
          child: Text(
            op,
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
