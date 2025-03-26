import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';

class ReactBuilder<T> extends StatelessWidget {
  final Rc<T> value;
  final Widget Function(T value) builder;

  const ReactBuilder({super.key, required this.builder, required this.value});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: value.notifier,
      builder: (context, value, child) => builder.call(value),
    );
  }
}
