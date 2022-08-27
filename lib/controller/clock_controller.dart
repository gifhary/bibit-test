import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:math' as math;

class ClockController extends GetxController {
  late Function(int hour, int minute, int second) onTimeUpdate;

  double secAngle = 0;
  double secOldAngle = 0;
  double secAngleDelta = 0;

  double minAngle = 0;
  double minOldAngle = 0;
  double minAngleDelta = 0;

  double hourAngle = 0;
  double hourOldAngle = 0;
  double hourAngleDelta = 0;

  ClockController(
      {required Function(int hour, int minute, int second) onTimeUpdate}) {
    // ignore: prefer_initializing_formals
    this.onTimeUpdate = onTimeUpdate;
  }

  @override
  onInit() {
    super.onInit();
    _initCurrentTime();
  }

  _updateTime() {
    int hour = int.parse(((hourAngle * 180 / math.pi) / 30).toStringAsFixed(0));
    int minute = int.parse(((minAngle * 180 / math.pi) / 6).toStringAsFixed(0));
    int second = int.parse(((secAngle * 180 / math.pi) / 6).toStringAsFixed(0));

    onTimeUpdate(hour, minute, second);
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

  double _limitTo60Tick(double angle) {
    int angleIn60Tick =
        int.parse(((angle * 180 / math.pi) / 6).toStringAsFixed(0));

    //sometimes when the hands turned backward, the value received is negative number
    //this to fix the negative number
    if (angleIn60Tick < 0) {
      angleIn60Tick = 60 + angleIn60Tick;
    }

    if (angleIn60Tick >= 60) {
      return (angleIn60Tick % 60) * 6 * math.pi / 180;
    }
    return angleIn60Tick * 6 * math.pi / 180;
  }

  double _limitTo12Tick(double angle) {
    int angleIn12Tick =
        int.parse(((angle * 180 / math.pi) / 30).toStringAsFixed(0));

    if (angleIn12Tick < 0) {
      angleIn12Tick = 12 + angleIn12Tick;
    }

    if (angleIn12Tick > 12) {
      return (angleIn12Tick % 12) * 30 * math.pi / 180;
    }
    return angleIn12Tick * 30 * math.pi / 180;
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
    _updateTime();
  }

  onSecPanUpdate(DragUpdateDetails details, Offset centerOfGestureDetector) {
    final touchPositionFromCenter =
        details.localPosition - centerOfGestureDetector;

    secAngle = touchPositionFromCenter.direction + secAngleDelta;

    secAngle = _limitTo60Tick(secAngle);
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
    _updateTime();
  }

  onMinPanUpdate(DragUpdateDetails details, Offset centerOfGestureDetector) {
    final touchPositionFromCenter =
        details.localPosition - centerOfGestureDetector;

    minAngle = touchPositionFromCenter.direction + minAngleDelta;
    minAngle = _limitTo60Tick(minAngle);
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
    _updateTime();
  }

  onHourPanUpdate(DragUpdateDetails details, Offset centerOfGestureDetector) {
    final touchPositionFromCenter =
        details.localPosition - centerOfGestureDetector;

    hourAngle = touchPositionFromCenter.direction + hourAngleDelta;
    hourAngle = _limitTo12Tick(hourAngle);
    update();
  }
}
