
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotficationManeger {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// here the all funtions for notification =>
  static init() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> newNotification(String title, String body) async {
    await flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        const NotificationDetails(
            android: AndroidNotificationDetails("post", "Post_notification",
                icon: '@mipmap/ic_launcher',
                importance: Importance.max,
                color: Color.fromARGB(255, 218, 173, 255),
                playSound: true,
                priority: Priority.high)));
  }

  static Future<void> dailynotification(
      String title, String body, int id) async {
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id,
        title,
        body,
        RepeatInterval.daily,
        const NotificationDetails(
            android: AndroidNotificationDetails("beta", "tester_notification",
                icon: '@mipmap/ic_launcher',
                importance: Importance.max,
                priority: Priority.high)));
  }

  static Future<void> cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  /// here the all funtions for notification =>
}
