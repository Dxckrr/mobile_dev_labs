import 'package:flutter/material.dart';
import 'package:frontend/auth_service.dart';
import 'package:frontend/biometrics_widget.dart';

class RegisterBiometrics extends StatelessWidget {
  final _authService = AuthService();

  RegisterBiometrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration biometrics Page')),
      body: Center(
        child: BiometricsWidget(
          authService: _authService,
          isRegistration: true,
        ),
      ),
    );
  }
}
