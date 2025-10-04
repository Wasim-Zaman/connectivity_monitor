import 'dart:async';

import 'package:connectivity_monitor/services/connectivity_service.dart';
import 'package:connectivity_monitor/services/cubits/connectivity_status_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityCubit extends Cubit<ConnectivityStatus> {
  final ConnectivityService _connectivityService = ConnectivityService();
  late final StreamSubscription<ConnectivityStatus> _subscription;

  ConnectivityCubit() : super(ConnectivityDisconnected()) {
    _subscription = _connectivityService.connectivityStream.listen((status) {
      emit(status);
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
