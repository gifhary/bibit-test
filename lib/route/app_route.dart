import 'package:bibit_clock/route/route_constant.dart';
import 'package:bibit_clock/screen/chart_screen.dart';
import 'package:bibit_clock/screen/home_screen.dart';
import 'package:get/get.dart';

class AppRute {
  static final all = [
    GetPage(name: RouteConstant.home, page: () => const HomeScreen()),
    GetPage(name: RouteConstant.chart, page: () => ChartScreen())
  ];
}
