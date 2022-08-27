import 'package:bibit_clock/controller/home_controller.dart';
import 'package:bibit_clock/widget/clock/clock.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Clock Test'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Clock(
                    onTimeUpdate: controller.onTimeUpdate,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 42),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${controller.hour}:${controller.minute}:${controller.second}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        const SizedBox(width: 24),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: controller.isAm ? null : Colors.white),
                            onPressed: () => controller.updateIsAm(true),
                            child: Text('AM',
                                style: TextStyle(
                                    color: controller.isAm
                                        ? Colors.white
                                        : Colors.black))),
                        const SizedBox(width: 12),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: controller.isAm ? Colors.white : null),
                            onPressed: () => controller.updateIsAm(false),
                            child: Text('PM',
                                style: TextStyle(
                                    color: controller.isAm
                                        ? Colors.black
                                        : Colors.white)))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: controller.setAlarm,
                        child: const Text('SET ALARM')),
                  )
                ],
              ),
            ),
          );
        });
  }
}
