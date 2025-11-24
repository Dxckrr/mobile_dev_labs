import 'package:flutter/material.dart';

class LoggedPage extends StatelessWidget {
  const LoggedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Logged In Page')),
      body: const Center(
        child: Text('You are now logged in!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
