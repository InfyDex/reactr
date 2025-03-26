import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';

class React extends StatefulWidget {
  final Widget Function() builder;

  const React(this.builder, {super.key});

  @override
  State<React> createState() => _ReactState();
}

class _ReactState extends State<React> {
  Set<Rc<dynamic>>? newDependencies;

  @override
  void initState() {
    super.initState();
    RcObserver.startTracking();
    widget.builder();
    newDependencies = RcObserver.endTracking();
    if (newDependencies != null && newDependencies!.isNotEmpty) {
      for (var depend in newDependencies!) {
        depend.addListener(_update);
      }
    }
  }

  @override
  void dispose() {
    if (newDependencies != null && newDependencies!.isNotEmpty) {
      for (var depend in newDependencies!) {
        depend.removeListener(_update);
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder();
  }

  void _update() {
    if (mounted) setState(() {});
  }
}
