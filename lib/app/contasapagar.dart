// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';

import '../responsive.dart';
import 'home/components/side_menu.dart';

class HomeIII extends StatelessWidget {
  const HomeIII({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool visivel = true;
    if (Responsive.isDesktop(context)) {
      visivel = false;
    }
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Visibility(
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: visivel,
            );
          },
        ),
        title:
            Text("Financeiro", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1A202E),
      ),
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
