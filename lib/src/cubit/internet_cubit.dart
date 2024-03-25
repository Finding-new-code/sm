import 'dart:async';
import 'package:equatable/equatable.dart';
import '../../constants/tools.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetInitial()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
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
}
