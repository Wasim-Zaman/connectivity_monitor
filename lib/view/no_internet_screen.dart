import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/connectivity_provider.dart';

class NoInternetScreen extends ConsumerWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivityStatus = ref.watch(connectivityStatusProvider);

    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // No internet icon
                Icon(
                  Icons.wifi_off_rounded,
                  size: 80,
                  color: Colors.red.shade400,
                ),

                const SizedBox(height: 24),

                // Title
                Text(
                  'No Internet Connection',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                // Description
                Text(
                  'Please check your internet connection and try again.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.red.shade600),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                // Connection status indicator
                connectivityStatus.when(
                  data: (status) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: status == ConnectivityStatus.connected
                            ? Colors.green.shade100
                            : status == ConnectivityStatus.checking
                            ? Colors.orange.shade100
                            : Colors.red.shade100,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: status == ConnectivityStatus.connected
                              ? Colors.green.shade400
                              : status == ConnectivityStatus.checking
                              ? Colors.orange.shade400
                              : Colors.red.shade400,
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
                            size: 16,
                            color: status == ConnectivityStatus.connected
                                ? Colors.green.shade700
                                : status == ConnectivityStatus.checking
                                ? Colors.orange.shade700
                                : Colors.red.shade700,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            status == ConnectivityStatus.connected
                                ? 'Connected'
                                : status == ConnectivityStatus.checking
                                ? 'Checking...'
                                : 'Disconnected',
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
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stackTrace) => Text(
                    'Error checking connectivity',
                    style: TextStyle(color: Colors.red.shade700),
                  ),
                ),

                const SizedBox(height: 24),

                // Retry instructions
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'The app will automatically reconnect when internet is available.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
