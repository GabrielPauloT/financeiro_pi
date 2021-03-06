/* import 'package:financeiro_pi/app/dashboard/dashboard_screen.dart'; */
import 'package:flutter/material.dart';
import '../../responsive.dart';
import '../contas_pagar.dart';
import 'components/side_menu.dart';

class PagScreen extends StatelessWidget {
  const PagScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: ContasPagar(),
            ),
          ],
        ),
      ),
    );
  }
}
