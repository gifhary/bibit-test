import 'package:bibit_clock/route/app_route.dart';
import 'package:bibit_clock/route/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppRute.all,
      initialRoute: RouteConstant.home,
    );
  }
}
