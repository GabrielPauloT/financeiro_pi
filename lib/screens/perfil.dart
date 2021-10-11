import 'package:financeiro_pi/screens/home/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'home/components/custom_appbar.dart';
import 'home/components/side_menu.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: SideMenu(),
    );
  }
}
