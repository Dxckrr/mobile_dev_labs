import 'package:flutter/material.dart';
import 'package:flutter_show_modal_bottom_sheet/first_view.dart';
import 'package:flutter_show_modal_bottom_sheet/second_view.dart';
import 'package:flutter_show_modal_bottom_sheet/third_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Show modal bottom sheet App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstView(),
        '/2': (context) => SecondView(),
      },
    );
  }
}
