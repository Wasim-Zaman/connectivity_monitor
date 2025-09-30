import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/connectivity_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final connectivityStatus = ref.watch(connectivityStatusProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Connectivity Monitor'),
        actions: [
          // Show connectivity status in app bar
          connectivityStatus.when(
            data: (status) => Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    status == ConnectivityStatus.connected
                        ? Icons.wifi_rounded
                        : status == ConnectivityStatus.checking
                        ? Icons.wifi_find_rounded
                        : Icons.wifi_off_rounded,
                    color: status == ConnectivityStatus.connected
                        ? Colors.green
                        : status == ConnectivityStatus.checking
                        ? Colors.orange
                        : Colors.red,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    status == ConnectivityStatus.connected
                        ? 'Online'
                        : status == ConnectivityStatus.checking
                        ? 'Checking'
                        : 'Offline',
                    style: TextStyle(
                      fontSize: 12,
                      color: status == ConnectivityStatus.connected
                          ? Colors.green
                          : status == ConnectivityStatus.checking
                          ? Colors.orange
                          : Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            loading: () => const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            error: (_, __) => const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.error, color: Colors.red, size: 20),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.network_check_rounded,
              size: 64,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 24),

            const Text(
              'This app monitors your internet connection!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            const Text(
              'Try turning off your internet to see the no-connection screen.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // Counter demo to show app functionality
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 32),

            // Current connectivity status card
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Current Connection Status:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    connectivityStatus.when(
                      data: (status) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: status == ConnectivityStatus.connected
                              ? Colors.green.shade50
                              : status == ConnectivityStatus.checking
                              ? Colors.orange.shade50
                              : Colors.red.shade50,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: status == ConnectivityStatus.connected
                                ? Colors.green
                                : status == ConnectivityStatus.checking
                                ? Colors.orange
                                : Colors.red,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              status == ConnectivityStatus.connected
                                  ? Icons.wifi_rounded
                                  : status == ConnectivityStatus.checking
                                  ? Icons.wifi_find_rounded
                                  : Icons.wifi_off_rounded,
                              size: 20,
                              color: status == ConnectivityStatus.connected
                                  ? Colors.green.shade700
                                  : status == ConnectivityStatus.checking
                                  ? Colors.orange.shade700
                                  : Colors.red.shade700,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              status == ConnectivityStatus.connected
                                  ? 'Connected to Internet'
                                  : status == ConnectivityStatus.checking
                                  ? 'Checking Connection...'
                                  : 'No Internet Connection',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: status == ConnectivityStatus.connected
                                    ? Colors.green.shade700
                                    : status == ConnectivityStatus.checking
                                    ? Colors.orange.shade700
                                    : Colors.red.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      loading: () => const CircularProgressIndicator(),
                      error: (error, stackTrace) => Text(
                        'Error: $error',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
