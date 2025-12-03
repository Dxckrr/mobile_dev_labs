import 'package:flutter/material.dart';
import 'package:flutter_show_modal_bottom_sheet/third_view.dart';

class SecondView extends StatelessWidget {
  SecondView({super.key});

  final List<Map<String, dynamic>> colorOptions = [
    {"name": "Amarillo", "color": Colors.yellow},
    {"name": "Azul", "color": Colors.blue},
    {"name": "Rojo", "color": Colors.red},
    {"name": "Verde", "color": Colors.green},
    {"name": "Naranja", "color": Colors.orange},
  ];

  void _showColorOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: colorOptions.map((item) {
              return ListTile(
                leading: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: item["color"],
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.black26),
                  ),
                ),
                title: Text(item["name"]),
                onTap: () {
                  Navigator.pop(context, item);
                },
              );
            }).toList(),
          ),
        );
      },
    ).then((selectedColor) {
      if (selectedColor != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ThirdView(color: selectedColor["name"]),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second View')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showColorOptions(context),
          child: const Text("Mostrar opciones"),
        ),
      ),
    );
  }
}
