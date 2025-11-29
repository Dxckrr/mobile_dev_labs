import 'package:flutter/material.dart';
import 'package:frontend_/services/auth/auth_service.dart';
import 'package:frontend_/main/main_page.dart';

class LoggedPage extends StatefulWidget {
  const LoggedPage({super.key});

  @override
  State<LoggedPage> createState() => _LoggedPageState();
}

class _LoggedPageState extends State<LoggedPage> {
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Logged In"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authService.logout();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: MainPage(),
    );
  }
}
