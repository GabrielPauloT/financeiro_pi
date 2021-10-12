// ignore_for_file: prefer_const_constructors, unnecessary_new

/* import 'package:financeiro_pi/app/contas.dart'; */
import 'package:flutter/material.dart';

import 'home/components/custom_appbar.dart';
import 'home/components/side_menu.dart';
/* import 'package:fluttericon/font_awesome_icons.dart'; */

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF4F4F7),
        drawer: const SideMenu(),
        appBar: new CustomAppBar());
  }
}
