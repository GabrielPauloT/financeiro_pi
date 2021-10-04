import 'package:financeiro_pi/app/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'app/contas.dart';
import 'app/home.dart';
import 'app/contasapagar.dart';

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

class HomeIII extends StatelessWidget {
  const HomeIII({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contas a Pagar',
      theme: ThemeData(
        primarySwatch: Colors.blue, //comentario
      ),
      home: const HomeIII(),
    );
  }
}
