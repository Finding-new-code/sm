import 'package:flutter/material.dart';
import '../constants/tools.dart';

class BackgroundTaskManegers {
  // TODO: here the background task code goes using workmaneger
  final Workmanager workmanager = Workmanager();

@pragma('vm:entry-point')
  callbackDispatcher() {
    Workmanager().executeTask((task, inputData) {
      debugPrint(
          "Native called background task: $task"); //simpleTask will be emitted here.
      return Future.value(true);
    });
  }

@pragma('vm:entry-point')
  notify() {
    workmanager.registerPeriodicTask('notify', 'simpleTask',
        frequency: const Duration(seconds: 10),
        initialDelay: const Duration(seconds: 5),
        constraints: Constraints(networkType: NetworkType.connected),
        inputData: {
          'title': 'satya Prakash nayak',
          'body': 'this is a notification',
          'id': 1,
          'sound': 'default'
        });
  }
}
