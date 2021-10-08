import 'package:financeiro_pi/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'package:hovering/hovering.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

import '../home_screen.dart';
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
        physics: const NeverScrollableScrollPhysics(),
        // it enables scrolling
        child: Container(
          height: 1000,
          color: const Color(0xFF1A202E),
          child: Column(
            children: [
              DrawerHeader(
                  /* margin: const EdgeInsets.only(bottom: 9000), */
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
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText('Financeiro',
                          speed: const Duration(milliseconds: 100),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.white54,
                          ))
                    ],
                    isRepeatingAnimation: false,
                  ),
                  /* const Text("Financeiro",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.white54,
                      )), */
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

              /* DrawerListTile(
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
              ), */
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
    return HoverAnimatedContainer(
      child: ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white54),
        ),
        leading: Icon(icon, color: Colors.white54),
      ),
      color: const Color(0xFF1A202E),
      hoverColor: const Color(0xFF141924),
    );
  }
}
