// ignore_for_file: prefer_const_constructors, unnecessary_new

/* import 'package:financeiro_pi/app/contas.dart'; */
import 'package:financeiro_pi/core/constants/color_constants.dart';
import 'package:financeiro_pi/core/models/grapichsteste.dart';
import 'package:financeiro_pi/screens/home/components/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';
/* import 'home/components/custom_appbar.dart';
import 'home/components/side_menu.dart'; */
import 'home/components/side_menu.dart';
import 'home/components/user_details_widget.dart';
/* import 'package:fluttericon/font_awesome_icons.dart'; */

/* class DashBoard extends StatelessWidget {
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
              /* MiniInformation(), */
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
 */
import 'package:syncfusion_flutter_charts/charts.dart';

class DashBoard extends SampleView {
  const DashBoard({Key? key}) : super(key: key);

  /// Creates the stacked line chart sample.

  @override
  _DashBoardState createState() => _DashBoardState();
}

/// State class of the stacked line chart.
class _DashBoardState extends SampleViewState {
  _DashBoardState();
  late TrackballBehavior _trackballBehavior;
  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Color(0xFFF4F4F7),
            drawer: const SideMenu(),
            appBar: new CustomAppBar(),
            body: Container(
              alignment: Alignment.bottomCenter,
              height: 400,
              width: 1150,
              child: _buildStackedLineChart(),
            )));
  }

  /// Returns the cartesian stacked line chart.
  SfCartesianChart _buildStackedLineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: isCardView ? '' : 'Monthly expense of a family'),
      legend: Legend(isVisible: !isCardView),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        labelRotation: isCardView ? 0 : -45,
      ),
      primaryYAxis: NumericAxis(
          maximum: 200,
          axisLine: const AxisLine(width: 0),
          labelFormat: r'${value}',
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getStackedLineSeries(),
      trackballBehavior: _trackballBehavior,
    );
  }

  /// Returns the list of chart seris which need to render
  /// on the stacked line chart.
  List<StackedLineSeries<ChartSampleData, String>> _getStackedLineSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      //essa parte cria os bagui de baixo
      ChartSampleData(
          x: 'Janeiro',
          y: 55,
          yValue: 10,
          secondSeriesYValue: 45,
          thirdSeriesYValue: 48),
      ChartSampleData(
          x: 'Fevereiro',
          y: 33,
          yValue: 45,
          secondSeriesYValue: 54,
          thirdSeriesYValue: 28),
      ChartSampleData(
          x: 'Março',
          y: 43,
          yValue: 23,
          secondSeriesYValue: 20,
          thirdSeriesYValue: 34),
      ChartSampleData(
          x: 'Abril',
          y: 32,
          yValue: 54,
          secondSeriesYValue: 23,
          thirdSeriesYValue: 54),
      ChartSampleData(
          x: 'Maio',
          y: 56,
          yValue: 18,
          secondSeriesYValue: 43,
          thirdSeriesYValue: 55),
      ChartSampleData(
          x: 'Junho',
          y: 23,
          yValue: 54,
          secondSeriesYValue: 33,
          thirdSeriesYValue: 56),
      ChartSampleData(
          x: 'Julho',
          y: 23,
          yValue: 54,
          secondSeriesYValue: 33,
          thirdSeriesYValue: 56),
      ChartSampleData(
          x: 'Agosto',
          y: 23,
          yValue: 54,
          secondSeriesYValue: 33,
          thirdSeriesYValue: 56),
      ChartSampleData(
          x: 'Setembro',
          y: 23,
          yValue: 54,
          secondSeriesYValue: 33,
          thirdSeriesYValue: 56),
    ];

    //Essa parte cria as linhas
    return <StackedLineSeries<ChartSampleData, String>>[
      StackedLineSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'Father',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLineSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue,
          name: 'Mother',
          markerSettings: const MarkerSettings(isVisible: true)),
      /*  StackedLineSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: 'Son',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLineSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
          name: 'Daughter',
          markerSettings: const MarkerSettings(isVisible: true)) */
    ];
  }
}
