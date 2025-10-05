import 'package:get/get.dart';

class CounterController extends GetxController {
  // State variable to hold the current count
  var count = 0.obs;

  // Method to increment the count
  void increment() {
    count++;
  }

  // Method to decrement the count
  void decrement() {
    count--;
  }
}
