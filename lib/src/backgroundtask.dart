import 'dart:developer';
import '../constants/tools.dart';

class BackgroundTaskManegers {
  final Workmanager workmanager = Workmanager();

@pragma('vm:entry-point')
  callbackDispatcher(String task,) {
    // switch (task) {
    //   case 'task1':
    //     // TODO: do task 1
    //     break;
    //   case 'task2':
    //     // TODO: do task 2
    //     break;
    // }
  
  @pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {

    int? totalExecutions;
    final _sharedPreference = await SharedPreferences.getInstance(); //Initialize dependency

    try { //add code execution
      totalExecutions = _sharedPreference.getInt("totalExecutions");
      _sharedPreference.setInt("totalExecutions", totalExecutions == null ? 1 : totalExecutions+1);
    } catch(err) {
      log(err.toString()); // Logger flutter package, prints error on the debug console
      throw Exception(err);
    }

    return Future.value(true);
  });
}
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
