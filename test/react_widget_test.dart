import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reactr/reactr.dart';

void main() {
  group('React Widget Tests', () {
    testWidgets('should automatically track observable variables',
        (WidgetTester tester) async {
      final controller = TestController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: React(() {
              return Text(
                  'Count: ${controller.count.value}, Visible: ${controller.isVisible.value}');
            }),
          ),
        ),
      );

      // Initial state
      expect(find.text('Count: 0, Visible: true'), findsOneWidget);

      // Update count
      controller.increment();
      await tester.pump();
      expect(find.text('Count: 1, Visible: true'), findsOneWidget);

      // Update visibility
      controller.toggleVisibility();
      await tester.pump();
      expect(find.text('Count: 1, Visible: false'), findsOneWidget);

      // Update both
      controller.increment();
      controller.toggleVisibility();
      await tester.pump();
      expect(find.text('Count: 2, Visible: true'), findsOneWidget);
    });

    testWidgets('should handle multiple React widgets independently',
        (WidgetTester tester) async {
      final controller = TestController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                React(() {
                  return Text('Count: ${controller.count.value}');
                }),
                React(() {
                  return Text('Visible: ${controller.isVisible.value}');
                }),
              ],
            ),
          ),
        ),
      );

      // Initial state
      expect(find.text('Count: 0'), findsOneWidget);
      expect(find.text('Visible: true'), findsOneWidget);

      // Update count only
      controller.increment();
      await tester.pump();
      expect(find.text('Count: 1'), findsOneWidget);
      expect(find.text('Visible: true'), findsOneWidget);

      // Update visibility only
      controller.toggleVisibility();
      await tester.pump();
      expect(find.text('Count: 1'), findsOneWidget);
      expect(find.text('Visible: false'), findsOneWidget);
    });
  });
}

class TestController {
  final count = RcInt(0);
  final isVisible = RcBool(true);

  void increment() {
    count.value++;
  }

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }
}
