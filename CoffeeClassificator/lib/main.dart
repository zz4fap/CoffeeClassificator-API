import 'package:flutter/material.dart';
import 'classificador_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Classificador de Café',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const ClassificadorPage(),
    );
  }
}