import 'package:flutter/material.dart';

class ThridPage extends StatelessWidget {
  const ThridPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String nombre = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text('Tercera vista')),
      backgroundColor: Colors.lightGreen[100],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Bienvenido a la tercera vista , $nombre",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 40),
            Image(image: AssetImage('assets/cat.jpg')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "Espero que la vista 3 te agradara, $nombre");
              },
              child: const Text('Ir a la vista 2'),
            ),
          ],
        ),
      ),
    );
  }
}
