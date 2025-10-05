import 'package:connectivity_monitor/controllers/connectivity_controller.dart';
import 'package:connectivity_monitor/services/connectivity_services.dart';
import 'package:get/get.dart';

class ResourceBindings extends Bindings {
  @override
  void dependencies() {
    // Services
    Get.lazyPut(() => ConnectivityService());

    // Controllers
    Get.lazyPut(() => ConnectivityController());
  }
}
