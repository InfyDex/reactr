// This is a basic Flutter widget test for the Reactr example app.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('Reactr example app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the home page is displayed
    expect(find.text('Flutter Demo Home Page'), findsOneWidget);
    expect(find.text('Open Counter'), findsOneWidget);

    // Tap the 'Open Counter' button and trigger a frame.
    await tester.tap(find.text('Open Counter'));
    await tester.pumpAndSettle();

    // Verify that the counter page is displayed
    expect(find.text('Counter Demo'), findsOneWidget);
    expect(find.text('Open Bottom Sheet'), findsOneWidget);
    expect(find.text('Show SnackBar'), findsOneWidget);
    expect(find.text('You have pushed the button this many times:'),
        findsOneWidget);

    // Verify that the counter starts at 0
    expect(find.text('0 0'), findsOneWidget);

    // Tap the '+' button and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the counter has incremented.
    expect(find.text('1 0'), findsOneWidget);

    // Tap the safety check button and trigger a frame.
    await tester.tap(find.byIcon(Icons.safety_check));
    await tester.pump();

    // Verify that the second counter has incremented.
    expect(find.text('1 1'), findsOneWidget);
  });
}
