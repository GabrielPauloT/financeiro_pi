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

      /* drawer: new Drawer(
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: new Text(
              "Financeiro",
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
            /* accountEmail: new Text("TechMotrs@tech.com.br"), */
            currentAccountPicture: Image.asset('assets/imagens/download.jpeg'),
            decoration: new BoxDecoration(color: Colors.grey.shade900),
            accountEmail: null,
          ),
          ListTile(
            leading: Icon(FontAwesome.home),
            title: Text("Home"),
            onTap: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeI()));
            },
          ),
          ListTile(
            leading: Icon(FontAwesome.dollar),
            title: Text("Contas a receber"),
            onTap: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeII()));
            },
          ),
          ListTile(
            leading: Icon(FontAwesome.money),
            title: Text("Contas a pagar"),
            onTap: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeIII()));
            },
          )
        ]),
      ), */
    );
  }
}
