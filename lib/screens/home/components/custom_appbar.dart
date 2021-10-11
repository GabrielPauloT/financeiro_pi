import 'package:financeiro_pi/responsive.dart';
import 'package:flutter/material.dart';

import '../../../responsive.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    late bool visivel;
    Responsive.isDesktop(context) ? visivel = false : visivel = true;
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return Visibility(
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
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
      /* title: const Text("Financeiro", style: TextStyle(color: Colors.black)), */
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Container(
          padding: const EdgeInsets.only(top: 15, right: 10),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
              text: 'Victor Pereira ',
              children: [
                WidgetSpan(
                  child: Icon(Icons.person, color: Colors.black),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
