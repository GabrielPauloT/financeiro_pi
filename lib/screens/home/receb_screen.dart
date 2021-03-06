import 'package:financeiro_pi/screens/contas_receber.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';
import 'components/side_menu.dart';

class RecebScreen extends StatelessWidget {
  const RecebScreen({Key? key}) : super(key: key);

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
            const Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: ContasReceber(),
            ),
          ],
        ),
      ),
    );
  }
}
