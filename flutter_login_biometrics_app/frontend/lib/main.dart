import 'package:flutter/material.dart';
import 'package:frontend/logged_page.dart';
import 'package:frontend/login_page.dart';
import 'package:frontend/register_biometrics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login with JWT & biometrics App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register-biometrics': (context) => RegisterBiometrics(),
        '/logged': (context) => LoggedPage(),
      },
    );
  }
}
