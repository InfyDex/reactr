import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';

class MultiReact extends StatelessWidget {
  final List<Rc> values;
  final Widget Function(List data) builder;

  const MultiReact({super.key, required this.builder, required this.values});

  @override
  Widget build(BuildContext context) {
    return _wrapWithListeners(builder, values);
  }

  Widget _wrapWithListeners(Widget Function(List data) builder, List<Rc> values) {
    if (values.isEmpty) {
      return builder(values.map((e) => e.value).toList());
    }

    Rc first = values.first;
    List<Rc> rest = values.sublist(1);

    return ValueListenableBuilder(
      valueListenable: first.notifier,
      builder: (context, value, child) {
        return _wrapWithListeners(
              (data) => builder([value, ...data]),
          rest,
        );
      },
    );
  }
}

