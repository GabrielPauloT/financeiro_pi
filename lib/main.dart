import 'package:flutter/material.dart';

/* import 'app/home.dart'; */
import 'app/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financeiro - P.I',
      theme: ThemeData(
        primarySwatch: Colors.blue, //comentario
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeII extends StatelessWidget {
  const HomeII({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contas pagas',
      theme: ThemeData(
        primarySwatch: Colors.blue, //comentario
      ),
      home: const HomeII(),
    );
  }
}
