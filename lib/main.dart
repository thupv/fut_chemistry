import 'package:flutter/material.dart';
import 'core/di.dart';

import 'package:fut_chemistry/screens/home/home_screen.dart';


void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}
