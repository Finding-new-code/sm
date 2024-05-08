import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import '../../constants/tools.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription<List<ConnectivityResult>>? connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetInitial()) {
    connectivityStreamSubscription = connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.isEmpty) {
        emit(InternetDisconnected());
      } else {
        emit(InternetConnected());
      }
    });
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription!.cancel();
    return super.close();
  }

  @override
  void onChange(Change<InternetState> change) {
    if (change.nextState is InternetConnected) {
      debugPrint('Internet Connected');
    } else if (change.nextState is InternetDisconnected) {
      debugPrint('Internet Disconnected');
    }

    super.onChange(change);
  }
}
