import 'package:bibit_clock/route/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class HomeController extends GetxController {
  final _notif = FlutterLocalNotificationsPlugin();

  bool isAm = true;
  int hour = 0;
  int minute = 0;
  int second = 0;

  @override
  void onInit() {
    super.onInit();

    _initNotif();
    tz.initializeTimeZones();
    _checkIfAppIsOpennedByNotif();

    final now = DateTime.now();
    hour = now.hour > 12 ? (now.hour % 12) : now.hour;
    minute = now.minute;
    second = now.second;

    if (now.hour > 12) {
      isAm = false;
    }
  }

  _checkIfAppIsOpennedByNotif() async {
    //notification tap handling when app is closed
    final notificationAppLaunchDetails = await FlutterLocalNotificationsPlugin()
        .getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      _goToChartScreen(notificationAppLaunchDetails?.payload ?? '');
    }
  }

  onTimeUpdate(int hour, int minute, int second) {
    this.hour = hour;
    this.minute = minute;
    this.second = second;

    debugPrint('hour: $hour, minute: $minute, second: $second');
    update();
  }

  updateIsAm(bool isAm) {
    this.isAm = isAm;
    update();
  }

  _goToChartScreen(String payload) {
    //notification payload is the time alarm fired converted to epoch time in milisecond
    //since pyload only accept string, we will double convert it to dateTime
    int? payloadInInt = int.tryParse(payload);

    DateTime? dateTime = payloadInInt != null
        ? DateTime.fromMillisecondsSinceEpoch(payloadInInt)
        : null;

    Get.toNamed(RouteConstant.chart, arguments: dateTime);
  }

  Future _initNotif() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = IOSInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: ios);

    //init notification object with function where to go when notif is tapped
    //onSelectNotification handles what to do when notif is tapped, it doesnt work when app is closed
    await _notif.initialize(
      settings,
      onSelectNotification: (payload) => _goToChartScreen(payload ?? ''),
    );
  }

  setAlarm() async {
    try {
      final now = DateTime.now();
      DateTime dateTime = DateTime(now.year, now.month, now.day,
          isAm ? hour : hour + 12, minute, second);

      debugPrint('current time $now');
      debugPrint('set to $dateTime');

      //if alarm is set to past time, it will throw error message
      if (!dateTime.isAfter(now)) throw 'Please select future time';

      //notification payload is the time alarm fired converted to epoch time in milisecond
      await _scheduleNotification(
          title: 'Alarm Test',
          body:
              'Alarm for ${DateFormat('HH:mm:ss').format(dateTime)} is activated',
          payload: dateTime.millisecondsSinceEpoch.toString(),
          time: dateTime);

      //a message to show if alarm is set correctly
      Fluttertoast.showToast(
          msg: 'Alarm is set ${timeago.format(dateTime, allowFromNow: true)}',
          toastLength: Toast.LENGTH_LONG);
    } catch (e) {
      //message when error
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future _scheduleNotification(
      {int id = 0,
      required String title,
      required String body,
      required String payload,
      required DateTime time}) async {
    _notif.zonedSchedule(id, title, body, tz.TZDateTime.from(time, tz.local),
        await _notifDetails(),
        payload: payload,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  static Future _notifDetails() async {
    //some paremeters can be put random string for this test
    return const NotificationDetails(
      android: AndroidNotificationDetails('channelId', 'channelName',
          channelDescription: 'channelDesc', importance: Importance.max),
      iOS: IOSNotificationDetails(),
    );
  }
}
