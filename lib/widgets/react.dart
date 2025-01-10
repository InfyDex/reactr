import 'package:flutter/material.dart';

class React<T> extends StatelessWidget {
  final ValueNotifier<T> notifier;
  final Widget Function(BuildContext context, T value) builder;

  const React({super.key, required this.builder, required this.notifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: notifier,
      builder: (context, value, child) => builder.call(context, value),
    );
  }
}
