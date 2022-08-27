import 'package:bibit_clock/controller/chart_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChartScreen extends StatelessWidget {
  ChartScreen({Key? key}) : super(key: key);

  final DateTime? dateTime = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChartController>(
        init: ChartController(dateTime: dateTime),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Chart'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dateTime != null
                      ? Text(
                          'Alarm is set at ${DateFormat('dd/MM/yyyy hh:mm:ss').format(dateTime!)} and time difference between alarm is fired and notification tapped is in ${controller.timeFiredToTapped} seconds')
                      : Container(),
                  const SizedBox(height: 24),
                  AspectRatio(
                    aspectRatio: 5 / 4,
                    child: BarChart(
                      BarChartData(
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(
                                  toY: controller.timeFiredToTapped.toDouble())
                            ]),
                          ],
                          titlesData: FlTitlesData(
                              topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                      showTitles: true,
                                      getTitlesWidget: (data1, data2) => Text(
                                          dateTime != null
                                              ? DateFormat(
                                                      'dd/MM/yyyy hh:mm:ss')
                                                  .format(dateTime!)
                                              : ''))))),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
