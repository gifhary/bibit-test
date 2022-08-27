import 'package:bibit_clock/controller/clock_controller.dart';
import 'package:bibit_clock/widget/clock/clock_body.dart';
import 'package:bibit_clock/widget/clock/clock_hand_hour.dart';
import 'package:bibit_clock/widget/clock/clock_hand_minute.dart';
import 'package:bibit_clock/widget/clock/clock_hand_second.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Clock extends StatelessWidget {
  final Function(int hour, int minute, int second) onTimeUpdate;
  const Clock({Key? key, required this.onTimeUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClockController>(
        init: ClockController(onTimeUpdate: onTimeUpdate),
        builder: (controller) {
          return AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                const ClockBody(),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClockHandHour(
                      angle: controller.hourAngle,
                      onPanStart: (details, centerOfGestureDetector) =>
                          controller.onHourPandStart(
                              details, centerOfGestureDetector),
                      onPanEnd: (details) => controller.onHourPanEnd(),
                      onPanUpdate: (details, centerOfGestureDetector) =>
                          controller.onHourPanUpdate(
                              details, centerOfGestureDetector),
                    ),
                    ClockHandMinute(
                      angle: controller.minAngle,
                      onPanStart: (details, centerOfGestureDetector) =>
                          controller.onMinPandStart(
                              details, centerOfGestureDetector),
                      onPanEnd: (details) => controller.onMinPanEnd(),
                      onPanUpdate: (details, centerOfGestureDetector) =>
                          controller.onMinPanUpdate(
                              details, centerOfGestureDetector),
                    ),
                    ClockHandSecond(
                      angle: controller.secAngle,
                      onPanStart: (details, centerOfGestureDetector) =>
                          controller.onSecPandStart(
                              details, centerOfGestureDetector),
                      onPanEnd: (details) => controller.onSecPanEnd(),
                      onPanUpdate: (details, centerOfGestureDetector) =>
                          controller.onSecPanUpdate(
                              details, centerOfGestureDetector),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
