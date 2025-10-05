import 'package:connectivity_monitor/models/connectivity_status.dart';
import 'package:connectivity_monitor/services/connectivity_services.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final _connectivityService = Get.find<ConnectivityService>();
  // Stream to listen to connectivity changes
  late final Stream<ConnectivityStatus> connectivityStream;

  // State variable to hold the current connectivity status
  var currentStatus = ConnectivityStatus().obs;

  @override
  void onInit() {
    super.onInit();
    connectivityStream = _connectivityService.connectivityStream;

    // listening to the stream
    connectivityStream.listen((status) {
      currentStatus.value = status;
    });
  }
}
