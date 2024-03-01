import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notfication {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// here the all funtions for notification =>
  void init() {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
  void newNotification(String title, String body) {
    flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        const NotificationDetails(
            android: AndroidNotificationDetails("post", "Post_notification",
                icon: '@mipmap/ic_launcher',
                importance: Importance.max,
                priority: Priority.high)));
  }

  void dailynotification (String title, String body, int id) {
    flutterLocalNotificationsPlugin.periodicallyShow(id, title, body, RepeatInterval.daily, const NotificationDetails(
        android: AndroidNotificationDetails("beta", "tester_notification",
            icon: '@mipmap/ic_launcher',
            importance: Importance.max,
            priority: Priority.high)));
  }

  void cancelAllNotification() {
    flutterLocalNotificationsPlugin.cancelAll();
  }
  /// here the all funtions for notification =>
}
