import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends Notifier<int> {
  final int _counter = 0;
  
  @override
  int build() {
    // Initial counter value
    return _counter;
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
