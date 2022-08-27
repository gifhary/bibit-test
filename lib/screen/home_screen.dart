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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Clock(
                      onTimeUpdate: controller.onTimeUpdate,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 42),
                      child: Text(
                        '${controller.hour}:${controller.minute}:${controller.second} ${controller.isAm ? 'AM' : 'PM'}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
