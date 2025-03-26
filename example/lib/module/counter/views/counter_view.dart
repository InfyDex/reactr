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
            FilledButton(
              onPressed: () => Reactr.snackBar(
                content: const Text("Sample SnackBar"),
              ),
              child: const Text("Show SnackBar"),
            ),
            const Text('You have pushed the button this many times:'),
            React(
              () => Text(
                '${controller.count.value.toString()} ${controller.count1.value.toString()}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: controller.increment,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                FilledButton(
                  onPressed: controller.increment1,
                  child: const Icon(Icons.safety_check),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
