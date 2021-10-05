import 'package:financeiro_pi/app/home/home_screen.dart';
import 'package:financeiro_pi/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../pag_screen.dart';
import '../receb_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              DrawerHeader(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                  Image.asset(
                    "assets/imagens/download.jpeg",
                    scale: 4,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  const Text("Financeiro",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.white54,
                      )),
                ],
              )),
              const Padding(padding: EdgeInsets.all(15)),
              DrawerListTile(
                title: "Dashboard",
                icon: FontAwesome.home,
                press: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
              ),
              DrawerListTile(
                title: "Contas a Pagar",
                icon: FontAwesome.dollar,
                press: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PagScreen()));
                },
              ),
              DrawerListTile(
                title: "Contas a Receber",
                icon: FontAwesome.dollar,
                press: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecebScreen()));
                },
              ),
              DrawerListTile(
                title: "",
                icon: null,
                press: () {},
              ),
              DrawerListTile(
                title: "",
                icon: null,
                press: () {},
              ),
              DrawerListTile(
                title: "",
                icon: null,
                press: () {},
              ),
              DrawerListTile(
                title: "",
                icon: null,
                press: () {},
              ),
              DrawerListTile(
                title: "",
                icon: null,
                press: () {},
              ),
              DrawerListTile(
                title: "",
                icon: null,
                press: () {},
              ),
              DrawerListTile(
                title: "",
                icon: null,
                press: () {},
              ),
              DrawerListTile(
                title: "",
                icon: null,
                press: () {},
              ),
              DrawerListTile(
                title: "",
                icon: null,
                press: () {},
              ),
              DrawerListTile(
                title: "",
                icon: null,
                press: () {},
              ),
              DrawerListTile(
                title: "",
                icon: null,
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final dynamic icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
      leading: Icon(icon, color: Colors.white54),
    );
  }
}
