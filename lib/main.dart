import 'package:financeiro_pi/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: 'Financeiro - P.I',
      debugShowCheckedModeBanner :false,
      theme: ThemeData(
        primarySwatch: Colors.blue, //comentario
      ),
      home: const HomeScreen(),
    );
  }
}
