import 'package:flutter/material.dart';
import 'package:flutter_routes_app/home_page.dart';
import 'package:flutter_routes_app/second_page.dart';
import 'package:flutter_routes_app/thrid_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Routes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/2': (context) => const SecondPage(),
        '/3': (context) => const ThridPage(),
      },
    );
  }
}
