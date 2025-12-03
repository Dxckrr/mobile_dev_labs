import 'package:flutter/material.dart';

class FirstView extends StatefulWidget {
  const FirstView({super.key});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  String? selectedColor;
  Color backgroundColor = Colors.white;
  final List<String> colorsAvailable = [
    'Amarillo',
    'Azul',
    'Rojo',
    'Verde',
    'Naranja',
  ];
  void _showColorOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...colorsAvailable.map((color) {
              return RadioListTile<String>(
                title: Text(color),
                value: color,
                groupValue: selectedColor,
                onChanged: (value) {
                  setState(() {
                    selectedColor = value;
                    switch (value) {
                      case 'Amarillo':
                        backgroundColor = Colors.yellow;
                        break;
                      case 'Azul':
                        backgroundColor = Colors.blue;
                        break;
                      case 'Rojo':
                        backgroundColor = Colors.red;
                        break;
                      case 'Verde':
                        backgroundColor = Colors.green;
                        break;
                      case 'Naranja':
                        backgroundColor = Colors.orange;
                        break;
                      default:
                        backgroundColor = Colors.white;
                    }
                  });
                  Navigator.pop(context);
                },
              );
            }),
          ],
          // children: ColorsAvailable.map((color) {
          //   return RadioGroup(
          //     groupValue: selectedColor,
          //     onChanged: (value) {
          //       setState(() {
          //         selectedColor = value;
          //         switch (value) {
          //           case 'Amarillo':
          //             backgroundColor = Colors.yellow;
          //             break;
          //           case 'Azul':
          //             backgroundColor = Colors.blue;
          //             break;
          //           case 'Rojo':
          //             backgroundColor = Colors.red;
          //             break;
          //           case 'Verde':
          //             backgroundColor = Colors.green;
          //             break;
          //           case 'Naranja':
          //             backgroundColor = Colors.orange;
          //             break;
          //           default:
          //             backgroundColor = Colors.white;
          //         }
          //       });
          //       Navigator.pop(context);
          //     },
          //     child: Text(color),
          //   );
          // }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First View'),
        actions: [
          IconButton(
            icon: const Icon(Icons.queue_play_next),
            onPressed: () {
              Navigator.pushNamed(context, '/2');
            },
          ),
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _showColorOptions,
                child: Text("Mostrar opciones"),
              ),
              const SizedBox(height: 20),
              Text(
                selectedColor == null
                    ? 'No color seleccionado'
                    : 'Color seleccionado: $selectedColor',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
