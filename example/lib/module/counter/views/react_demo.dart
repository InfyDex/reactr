import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';
import '../controllers/counter_controller.dart';

class ReactDemoView extends ReactrView<CounterController> {
  const ReactDemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('React Widget Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'React Widget Demo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Old approach with MultiReact
            const Text(
              'Old Approach (MultiReact):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: MultiReact(
                values: [
                  controller.count,
                  controller.count1,
                  controller.isVisible
                ],
                builder: (values) {
                  final count = values[0] as int;
                  final count1 = values[1] as int;
                  final isVisible = values[2] as bool;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Count: $count'),
                      Text('Count1: $count1'),
                      Text('Visible: $isVisible'),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // New approach with React
            const Text(
              'New Approach (React):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
              child: React(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Count: ${controller.count.value}'),
                    Text('Count1: ${controller.count1.value}'),
                    Text('Visible: ${controller.isVisible.value}'),
                  ],
                );
              }),
            ),
            const SizedBox(height: 20),

            // Multiple React widgets
            const Text(
              'Multiple React Widgets:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: React(() {
                      return Text(
                        'Count: ${controller.count.value}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    }),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: React(() {
                      return Text(
                        'Count1: ${controller.count1.value}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Control buttons
            const Text(
              'Controls:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: controller.increment,
                  child: const Text('Increment Count'),
                ),
                ElevatedButton(
                  onPressed: controller.increment1,
                  child: const Text('Increment Count1'),
                ),
                ElevatedButton(
                  onPressed: controller.toggleVisibility,
                  child: const Text('Toggle Visibility'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Explanation
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Key Differences:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Text(
                      '• React: Automatically tracks all observable variables used'),
                  Text(
                      '• MultiReact: Requires manual specification of variables to watch'),
                  Text('• React: Simpler syntax, less boilerplate'),
                  Text('• MultiReact: More explicit control over dependencies'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
