import 'package:connectivity_monitor/services/cubits/connectivity_status_states.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  Stream<ConnectivityStatus> get connectivityStream async* {
    // Check initial connectivity
    final initialResult = await _connectivity.checkConnectivity();
    yield _mapConnectivityResult(initialResult);

    // Listen to connectivity changes
    await for (final result in _connectivity.onConnectivityChanged) {
      yield _mapConnectivityResult(result);
    }
  }

  ConnectivityStatus _mapConnectivityResult(List<ConnectivityResult> results) {
    // If any connection type is available (wifi, mobile, ethernet), consider it connected
    for (final result in results) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.ethernet) {
        return ConnectivityConnected();
      }
    }
    return ConnectivityDisconnected();
  }
}
