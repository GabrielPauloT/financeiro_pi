import 'package:financeiro_pi/core/constants/color_constants.dart';
import 'package:financeiro_pi/screens/home/components/charts.dart';
//import 'package:smart_admin_dashboard/screens/dashboard/components/calendart_widget.dart';
//import 'package:smart_admin_dashboard/screens/dashboard/components/charts.dart';
//import 'package:smart_admin_dashboard/screens/dashboard/components/user_details_mini_card.dart';
import 'package:flutter/material.dart';

import 'user_details_mini_card.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          //CalendarWidget(),
          Text(
            "Detalhes",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          UserDetailsMiniCard(
            color: Color(0xfff8b250),
            title: "Titulos em Dia",
            amountOfFiles: "1000",
            numberOfIncrease: 1328,
          ),
          /* UserDetailsMiniCard(
            color: Color(0xfff8b250),
            title: "Titulos",
            amountOfFiles: "%16.7",
            numberOfIncrease: 1328,
          ), */
          UserDetailsMiniCard(
            color: Colors.red,
            title: "Titulos Vencidos",
            amountOfFiles: "100",
            numberOfIncrease: 1328,
          ),
          UserDetailsMiniCard(
            color: Color(0xff13d38e),
            title: "Titulos a Receber",
            amountOfFiles: "500",
            numberOfIncrease: 140,
          ),
        ],
      ),
    );
  }
}
