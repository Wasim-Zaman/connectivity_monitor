import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    // Initial counter value
    return 0;
  }

  // Method to increment the counter
  void increment() {
    state = state + 1;
  }

  void decrement() {
    state = state - 1;
  }

  // Method to reset the counter
  void reset() {
    state = 0;
  }
}

final counterProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);
