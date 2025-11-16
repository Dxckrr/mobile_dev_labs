import 'package:flutter/material.dart';
import 'package:flutter_calc_lab/calculator_screen.dart';
import 'package:flutter_calc_lab/helper.dart';
import 'calculator_button.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _inputController = TextEditingController();

  void _ejecutarFuncionEspecial(String sEtiqueta) {
    if (sEtiqueta == "AC") {
      _inputController.text = "";
    } else if (sEtiqueta == "CE") {
      _inputController.text = "";
    }
  } //_ejecutarFuncionEspecial

  void _actualizarPantallaCalculadora(String sEtiqueta) {
    _inputController.text = "${_inputController.text}$sEtiqueta";
  } //_actualizarPantallaCalculadora

  void _calculateResult() {
    String expresion = _inputController.text;

    if (expresion.isEmpty) return;

    expresion = expresion.replaceAll("x", "*");
    expresion = expresion.replaceAll("÷", "/");

    try {
      double resultado = evaluateExpresion(expresion);

      _inputController.text = resultado.toString().endsWith(".0")
          ? resultado.toStringAsFixed(0)
          : resultado.toString();
    } catch (e) {
      _inputController.text = "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 190, 190, 197),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: CalculatorScreen(controller: _inputController),
          ),
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
                          onPressed: () => _actualizarPantallaCalculadora("÷"),
                        ),
                        CalculatorButton(
                          label: "x",
                          isOperator: true,
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 2,
                          ),
                          onPressed: () => _actualizarPantallaCalculadora("x"),
                        ),
                        CalculatorButton(
                          label: "-",
                          isOperator: true,
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 2,
                          ),
                          onPressed: () => _actualizarPantallaCalculadora("-"),
                        ),

                        CalculatorButton(
                          label: "+",
                          isOperator: true,
                          flex: 2,
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 2,
                          ),
                          onPressed: () => _actualizarPantallaCalculadora("+"),
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
        final isEqual = label == "=";
        if (isEqual) {
          return CalculatorButton(
            label: label,
            isSpecial: true,
            onPressed: () => _calculateResult(),
          );
        }
        if (isSpecial) {
          return CalculatorButton(
            label: label,
            isSpecial: true,
            onPressed: () => _ejecutarFuncionEspecial(label),
          );
        }
        return CalculatorButton(
          label: label,
          isSpecial: isSpecial,
          onPressed: () => _actualizarPantallaCalculadora(label),
        );
      }).toList(),
    );
  }
}
