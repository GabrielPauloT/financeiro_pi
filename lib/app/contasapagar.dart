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
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(100, (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        }),
      ),
    );
  }
}
