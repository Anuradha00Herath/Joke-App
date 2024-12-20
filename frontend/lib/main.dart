import 'package:flutter/material.dart';
import 'views/jokes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jokes App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const JokesScreen(),
    );
  }
}
