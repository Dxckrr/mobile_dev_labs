import 'package:flutter/material.dart';
import 'package:frontend/auth_service.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome! You are logged in.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: _checkAuth,
              child: const Text("Check Authentication on Server"),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _serverResponse,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
