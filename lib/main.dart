import 'package:flutter/material.dart';

import 'app/contas.dart';
import 'app/home.dart';


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
      home: const HomeII(),
    );
  }
}
