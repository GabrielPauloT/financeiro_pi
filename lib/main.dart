import 'package:financeiro_pi/app/home/home_screen.dart';
import 'package:financeiro_pi/app/home/receb_screen.dart';
import 'package:flutter/material.dart';

import 'app/contas.dart';

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
