import 'package:bibit_clock/widget/clock/clock_body.dart';
import 'package:bibit_clock/widget/clock/clock_hand_hour.dart';
import 'package:bibit_clock/widget/clock/clock_hand_minute.dart';
import 'package:bibit_clock/widget/clock/clock_hand_second.dart';
import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          const ClockBody(),
          Stack(
            alignment: Alignment.center,
            children: [
              const ClockHandHour(),
              const ClockHandMinute(),
              const ClockHandSecond(),
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
  }
}
