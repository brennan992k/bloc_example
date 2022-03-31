import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/logic/constants/internet_type.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  late final StreamSubscription<ConnectivityResult> _connectivitySubscription;

  InternetCubit() : super(InternetLoading()) {
    final Connectivity _connectivity = Connectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        emit(InternetConnected(InternetType.wifi));
        break;
      case ConnectivityResult.mobile:
        emit(InternetConnected(InternetType.mobile));
        break;
      case ConnectivityResult.none:
        emit(InternetDisconnected());
        break;
      default:
        break;
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
