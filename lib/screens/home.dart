// ignore_for_file: prefer_const_constructors, unnecessary_new

/* import 'package:financeiro_pi/app/contas.dart'; */
import 'package:financeiro_pi/core/constants/color_constants.dart';
import 'package:financeiro_pi/screens/home/components/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';
/* import 'home/components/custom_appbar.dart';
import 'home/components/side_menu.dart'; */
import 'home/components/mini_information_card.dart';
import 'home/components/user_details_widget.dart';
/* import 'package:fluttericon/font_awesome_icons.dart'; */

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
/*      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFFF4F4F7),
        drawer: const SideMenu(),
        appBar: new CustomAppBar());
  } */
    return SafeArea(
      child: SingleChildScrollView(
        //padding: EdgeInsets.all(defaultPadding),
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              /* SideMenu(), */
              CustomAppBar(),
              SizedBox(height: defaultPadding),
              MiniInformation(),
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        //MyFiels(),
                        //SizedBox(height: defaultPadding),
                        SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context)) UserDetailsWidget(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we dont want to show it
                  if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 2,
                      child: UserDetailsWidget(),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
