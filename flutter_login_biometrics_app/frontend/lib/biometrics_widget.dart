import 'package:flutter/material.dart';
import 'package:frontend/auth_service.dart';
import 'package:local_auth/local_auth.dart';

class BiometricsWidget extends StatelessWidget {
  final AuthService authService;
  final bool isRegistration;

  const BiometricsWidget({
    super.key,
    required this.authService,
    required this.isRegistration,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final LocalAuthentication auth = LocalAuthentication();
        bool canCheckBiometrics = await auth.canCheckBiometrics;

        if (!canCheckBiometrics) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Tu dispositivo no soporta biometría"),
            ),
          );
          return;
        }

        try {
          final authenticated = await auth.authenticate(
            localizedReason: 'Autentícate con tu huella o rostro',
            biometricOnly: true,
          );

          if (!authenticated) return;
          final token = await authService.getToken();

          if (isRegistration) {
            final registration = await authService.enableBiometrics();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Biometría registrada con éxito")),
            );
            Navigator.pushNamed(context, '/');
          } else {
            if (token != null) {
              Navigator.pushNamed(context, '/logged');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "No hay biometría registrada. Inicia sesión normal y regístrala.",
                  ),
                ),
              );
            }
          }
        } catch (e) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Error al autenticar')));
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Text(
        isRegistration ? 'Registrar Biometría' : 'Login con Biometría',
      ),
    );
  }
}
