// ignore_for_file: prefer_const_constructors, unnecessary_new

/* import 'package:financeiro_pi/app/contas.dart'; */
import 'package:flutter/material.dart';

import '../../responsive.dart';

import 'home/components/side_menu.dart';
/* import 'package:fluttericon/font_awesome_icons.dart'; */

class HomeI extends StatelessWidget {
  const HomeI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool visivel;
    Responsive.isDesktop(context) ? visivel = false : visivel = true;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFFF4F4F7),
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
        title: Text("Financeiro", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            padding: EdgeInsets.only(top: 15, right: 10),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                text: 'Victor Pereira ',
                children: const [
                  WidgetSpan(
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
