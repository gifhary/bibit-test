import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:math' as math;

class ClockController extends GetxController {
  late Function(DateTime) onTimeUpdate;

  double secAngle = 0;
  double secOldAngle = 0;
  double secAngleDelta = 0;

  double minAngle = 0;
  double minOldAngle = 0;
  double minAngleDelta = 0;

  double hourAngle = 0;
  double hourOldAngle = 0;
  double hourAngleDelta = 0;

  ClockController({required Function(DateTime) onTimeUpdate}) {
    // ignore: prefer_initializing_formals
    this.onTimeUpdate = onTimeUpdate;
  }

  @override
  onInit() {
    super.onInit();
    _initCurrentTime();
  }

  _initCurrentTime() {
    //6 is the degree between ticks in analog clock, 360 / 60
    final now = DateTime.now();
    secAngle = now.second * 6 * math.pi / 180;
    secOldAngle = secAngle;

    minAngle = now.minute * 6 * math.pi / 180;
    minOldAngle = minAngle;

    hourAngle = now.hour * 30 * math.pi / 180;
    hourOldAngle = hourAngle;
  }

//scond drag functions
  onSecPandStart(DragStartDetails details, Offset centerOfGestureDetector) {
    final touchPositionFromCenter =
        details.localPosition - centerOfGestureDetector;
    secAngleDelta = secOldAngle - touchPositionFromCenter.direction;
  }

  onSecPanEnd() {
    secOldAngle = secAngle;
    update();

    debugPrint(((secAngle * 180 / math.pi) / 6).toStringAsFixed(0));
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

  //hour drag functions
  onHourPandStart(DragStartDetails details, Offset centerOfGestureDetector) {
    final touchPositionFromCenter =
        details.localPosition - centerOfGestureDetector;
    hourAngleDelta = hourOldAngle - touchPositionFromCenter.direction;
  }

  onHourPanEnd() {
    hourOldAngle = hourAngle;
    update();
    debugPrint('hour pan end $hourAngle');
  }

  onHourPanUpdate(DragUpdateDetails details, Offset centerOfGestureDetector) {
    final touchPositionFromCenter =
        details.localPosition - centerOfGestureDetector;

    hourAngle = touchPositionFromCenter.direction + hourAngleDelta;
    update();
  }
}
