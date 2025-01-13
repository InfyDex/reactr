import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';

class React<T> extends StatelessWidget {
  final Rc<T> value;
  final Widget Function(T value) builder;

  const React({super.key, required this.builder, required this.value});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: value.notifier,
      builder: (context, value, child) => builder.call(value),
    );
  }
}
