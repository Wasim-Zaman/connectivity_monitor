import 'dart:async';

import 'package:connectivity_monitor/models/connectivity_status.dart';
import 'package:connectivity_monitor/services/connectivity_services.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final _connectivityService = Get.find<ConnectivityService>();
  // Stream to listen to connectivity changes
  late final StreamSubscription<ConnectivityStatus> _subscription;

  // State variable to hold the current connectivity status
  var currentStatus = ConnectivityStatus().obs;

  @override
  void onInit() {
    super.onInit();

    _subscription = _connectivityService.connectivityStream.listen((status) {
      currentStatus.value = status;
    });
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}
