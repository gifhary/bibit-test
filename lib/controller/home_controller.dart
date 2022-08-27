import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isAm = true;
  int hour = 0;
  int minute = 0;
  int second = 0;

  @override
  void onInit() {
    super.onInit();

    final now = DateTime.now();
    hour = now.hour > 12 ? (now.hour % 12) : now.hour;
    minute = now.minute;
    second = now.second;

    if (now.hour > 12) {
      isAm = false;
    }
  }

  onTimeUpdate(int hour, int minute, int second) {
    this.hour = hour;
    this.minute = minute;
    this.second = second;

    debugPrint('hour: $hour, minute: $minute, second: $second');
    update();
  }
}
