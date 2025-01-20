import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';

class React extends StatelessWidget {
  final Widget Function() builder;

  const React(this.builder, {super.key});

  @override
  Widget build(BuildContext context) {
    RcObserver.startTracking();
    final result = builder();
    final newDependencies = RcObserver.endTracking();
    if (newDependencies != null && newDependencies.isNotEmpty) {
      return _wrapWithListeners(result, newDependencies);
    }
    return result;
  }

  Widget _wrapWithListeners(Widget child, Set<Rc> dependencies) {
    Widget result = child;

    for (final rc in dependencies) {
      result = ValueListenableBuilder<dynamic>(
        valueListenable: rc.notifier,
        builder: (context, _, __) => result,
      );
    }
    return result;
  }
}
