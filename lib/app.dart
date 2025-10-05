import 'package:connectivity_monitor/controllers/connectivity_controller.dart';
import 'package:connectivity_monitor/controllers/counter_controller.dart';
import 'package:connectivity_monitor/models/connectivity_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends GetView<CounterController> {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final connectivityController = Get.find<ConnectivityController>();

    final connectivityStatus = connectivityController.currentStatus.value;

    if (connectivityStatus == ConnectivityUnknown()) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    } else if (connectivityStatus == ConnectivityDisconnected()) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: const Center(
          child: Text(
            'No Internet Connection',
            style: TextStyle(fontSize: 24, color: Colors.red),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '${controller.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
