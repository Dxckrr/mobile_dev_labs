import 'package:flutter/material.dart';
import 'package:frontend_/auth_service.dart';
import 'package:frontend_/main/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggedPage extends StatefulWidget {
  const LoggedPage({super.key});

  @override
  State<LoggedPage> createState() => _LoggedPageState();
}

class _LoggedPageState extends State<LoggedPage> {
  final _authService = AuthService();
  String _serverResponse = 'Press the button to check authentication';

  Future<void> _checkAuth() async {
    final token = await _authService.getToken();
    if (token == null) {
      setState(() {
        _serverResponse = "No token found. User is NOT authenticated.";
      });
      return;
    }
    final serverValidation = await _authService.getServerValidation(token);
    setState(() {
      _serverResponse =
          "Token is valid, the server responded:\n$serverValidation";
    });
  }

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
