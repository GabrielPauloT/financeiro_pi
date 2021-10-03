// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class HomeII extends StatelessWidget {
  const HomeII({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title:
            Text("Financeiro", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xF513B5EB),
      ),
      drawer: new Drawer(
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
            decoration: new BoxDecoration(color: Color(0xF513B5EB)),
            accountEmail: null,
          ),
          ListTile(
            leading: Icon(FontAwesome.asl_interpreting),
            title: Text("Contas a receber"),
            /* onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              }, */
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Contas a pagar"),
            /* onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              }, */
          )
        ]),
      
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
