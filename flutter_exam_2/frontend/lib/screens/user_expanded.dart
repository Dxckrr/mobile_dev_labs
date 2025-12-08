import 'package:flutter/material.dart';
import 'package:frontend/classes/user.dart';

class UserExpanded extends StatelessWidget {
  final User user;

  const UserExpanded({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detalles del Usuario",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(radius: 50, backgroundImage: NetworkImage(user.photo)),
            const SizedBox(height: 20),

            Text(
              user.fullName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              "Rol: ${user.role}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.email, color: Colors.blue),
                const SizedBox(width: 8),
                Expanded(child: Text(user.email)),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.phone, color: Colors.green),
                const SizedBox(width: 8),
                Expanded(child: Text(user.phoneNumber)),
              ],
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Aquí luego vas a abrir pantalla para enviar mensaje
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Abrir chat o enviar mensaje"),
                    ),
                  );
                },
                icon: const Icon(Icons.message),
                label: const Text(
                  "Enviar mensaje",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
