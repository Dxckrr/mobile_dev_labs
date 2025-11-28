import 'package:flutter/material.dart';
import 'package:frontend_/logged_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JWT App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 71, 65, 82),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoggedPage(),
        '/main': (context) => LoggedPage(),
      },
    );
  }
}
