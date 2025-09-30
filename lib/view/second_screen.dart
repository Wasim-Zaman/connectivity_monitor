import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/connectivity_provider.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivityStatus = ref.watch(connectivityStatusProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Second Screen'),
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
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.screen_share_rounded,
                size: 64,
                color: Colors.deepPurple,
              ),

              SizedBox(height: 24),

              Text(
                'This is the Second Screen!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 16),

              Text(
                'Even here, the connectivity monitoring is active. Try turning off your internet to see the no-connection screen appear.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32),

              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(Icons.info_outline, color: Colors.blue, size: 32),
                      SizedBox(height: 12),
                      Text(
                        'Global Connectivity Monitoring',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'No matter which screen you\'re on, the app will automatically switch to the no-internet screen when connectivity is lost.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
