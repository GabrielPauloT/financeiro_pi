import 'package:financeiro_pi/core/constants/color_constants.dart';
import 'package:financeiro_pi/core/models/daily_info_model.dart';
import 'package:financeiro_pi/responsive.dart';
import 'package:financeiro_pi/screens/forms/input_form.dart';
import 'package:financeiro_pi/screens/home/components/mini_information_widget.dart';

import 'package:flutter/material.dart';

class MiniInformation extends StatelessWidget {
  const MiniInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SizedBox(
              width: 10,
            ),
            /* ElevatedButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return new FormMaterial();
                    },
                    fullscreenDialog: true));
              },
              icon: const Icon(Icons.add),
              label: const Text(
                "Add New",
              ),
            ), */
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: InformationCard(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.2 : 1,
          ),
          tablet: InformationCard(
            crossAxisCount: _size.width < 950 ? 2 : 4,
            childAspectRatio: _size.width < 950 ? 1.2 : 1,
          ),
          desktop: InformationCard(
            childAspectRatio: _size.width < 1400 ? 1.2 : 1.4,
          ),
        ),
      ],
    );
  }
}

class InformationCard extends StatelessWidget {
  const InformationCard({
    Key? key,
    this.crossAxisCount = 5,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dailyDatas.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          MiniInformationWidget(dailyData: dailyDatas[index]),
    );
  }
}
