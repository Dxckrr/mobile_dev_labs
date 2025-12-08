import 'package:flutter/material.dart';
import 'package:frontend/classes/user.dart';
import 'package:frontend/widgets/message_modal.dart';

class UserExpanded extends StatelessWidget {
  final User user;
  final String currentUserEmail;
  final String token;

  const UserExpanded({
    super.key,
    required this.user,
    required this.currentUserEmail,
    required this.token,
  });

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
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (_) => MessageModal(
                      emailFrom: currentUserEmail,
                      emailTo: user.email,
                      token : token
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
