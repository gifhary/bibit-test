import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ClockController extends GetxController {
  double secAngle = 0;
  double secOldAngle = 0;
  double secAngleDelta = 0;

  int mincAngle = 0;
  int minOldAngle = 0;
  int minAngleDelta = 0;

  int hourAngle = 0;
  int hourOldAngle = 0;
  int hourAngleDelta = 0;

  onSecPandStart(DragStartDetails details, Offset centerOfGestureDetector) {
    final touchPositionFromCenter =
        details.localPosition - centerOfGestureDetector;
    secAngleDelta = secOldAngle - touchPositionFromCenter.direction;
  }

  onSecPanEnd() {
    secOldAngle = secAngle;
    update();
    debugPrint('pan end $secAngle');
  }

  onSecPanUpdate(DragUpdateDetails details, Offset centerOfGestureDetector) {
    final touchPositionFromCenter =
        details.localPosition - centerOfGestureDetector;

    secAngle = touchPositionFromCenter.direction + secAngleDelta;
    update();
  }
}
