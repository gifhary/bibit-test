import 'package:get/get.dart';

class ChartController extends GetxController {
  DateTime? dateTime;
  int timeFiredToTapped = 0;

  ChartController({DateTime? dateTime}) {
    // ignore: prefer_initializing_formals
    this.dateTime = dateTime;
  }

  @override
  void onInit() {
    super.onInit();
    _calculateTimeFiredToTapped();
  }

  _calculateTimeFiredToTapped() {
    if (dateTime != null) {
      final now = DateTime.now();

      timeFiredToTapped = now.difference(dateTime!).inSeconds;
      update();
    }
  }
}
