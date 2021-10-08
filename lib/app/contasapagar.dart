// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';

import 'home/components/custom_appbar.dart';
import 'home/components/side_menu.dart';

class HomeIII extends StatelessWidget {
  const HomeIII({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F7),
      drawer: const SideMenu(),
      appBar: new CustomAppBar(),
      
    );
  }
}
