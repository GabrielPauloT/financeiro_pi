import 'package:financeiro_pi/responsive.dart';
import 'package:financeiro_pi/screens/home/components/popover_teste.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:hovering/hovering.dart';
import 'package:popover/popover.dart';
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
  late TapGestureRecognizer _longPressRecognizer;

  @override
  void initState() {
    super.initState();
    _longPressRecognizer = TapGestureRecognizer()
      ..onTap = () {
        showPopover(
          context: context,
          transitionDuration: const Duration(milliseconds: 150),
          bodyBuilder: (context) => const ListItems(),
          /* onPop: () => print('Popover was popped!'), */
          direction: PopoverDirection.top,
          width: 400,
          height: 400,
          arrowHeight: 15,
          arrowWidth: 30,
          /* backgroundColor: const Color(0xFF1A202E), */
        );
      };
  }

  @override
  void dispose() {
    _longPressRecognizer.dispose();
    super.dispose();
  }

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
                LineariconsFree.menu_circle,
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
          child: HoverAnimatedContainer(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                recognizer: _longPressRecognizer,
                text: 'Victor Pereira ',
                children: const [
                  WidgetSpan(
                    child:
                        Icon(FontAwesome5.user_astronaut, color: Colors.black),
                  ),
                ],
              ),
            ),
            hoverHeight: 160,
            hoverWidth: 160,
            width: 150,
            height: 300,
/*             color: Colors.white54,
            hoverColor: const Color(0xFFf7f7f7), */
          ),
        )
      ],
    );
  }
}
