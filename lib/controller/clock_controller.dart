import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ClockController extends GetxController {
  double secAngle = 0;
  double secOldAngle = 0;
  double secAngleDelta = 0;

  double minAngle = 0;
  double minOldAngle = 0;
  double minAngleDelta = 0;

  double hourAngle = 0;
  double hourOldAngle = 0;
  double hourAngleDelta = 0;

//scond drag functions
  onSecPandStart(DragStartDetails details, Offset centerOfGestureDetector) {
    final touchPositionFromCenter =
        details.localPosition - centerOfGestureDetector;
    secAngleDelta = secOldAngle - touchPositionFromCenter.direction;
  }

  onSecPanEnd() {
    secOldAngle = secAngle;
    update();
    debugPrint('second pan end $secAngle');
  }

  onSecPanUpdate(DragUpdateDetails details, Offset centerOfGestureDetector) {
    final touchPositionFromCenter =
        details.localPosition - centerOfGestureDetector;

    secAngle = touchPositionFromCenter.direction + secAngleDelta;
    update();
  }

//minute drag functions
  onMinPandStart(DragStartDetails details, Offset centerOfGestureDetector) {
    final touchPositionFromCenter =
        details.localPosition - centerOfGestureDetector;
    minAngleDelta = minOldAngle - touchPositionFromCenter.direction;
  }

  onMinPanEnd() {
    minOldAngle = minAngle;
    update();
    debugPrint('minute pan end $minAngle');
  }

  onMinPanUpdate(DragUpdateDetails details, Offset centerOfGestureDetector) {
    final touchPositionFromCenter =
        details.localPosition - centerOfGestureDetector;

    minAngle = touchPositionFromCenter.direction + minAngleDelta;
    update();
  }
}
