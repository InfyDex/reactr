import 'package:example/module/counter/controllers/counter_controller.dart';
import 'package:example/module/counter/views/test_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';

class CounterView extends ReactrView<CounterController> {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FilledButton(
              onPressed: () => Reactr.bottomSheet(
                builder: (context) => const TestBottomSheet(),
              ),
              child: const Text("Open Bottom Sheet"),
            ),
            const Text('You have pushed the button this many times:'),
            React(
              value: controller.count,
              builder: (value) => Text(
                '$value',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
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
