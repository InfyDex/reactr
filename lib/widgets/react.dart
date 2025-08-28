import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';

class React extends StatefulWidget {
  final Widget Function() builder;

  const React(this.builder, {super.key});

  @override
  State<React> createState() => _ReactState();
}

class _ReactState extends State<React> {
  Set<Rc<dynamic>>? _dependencies;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _trackDependencies();
  }

  void _trackDependencies() {
    // Start tracking dependencies
    RcObserver.startTracking();

    // Execute the builder to capture dependencies
    widget.builder();

    // Get the tracked dependencies
    final newDependencies = RcObserver.endTracking();

    // Remove listeners from old dependencies
    if (_dependencies != null) {
      for (var dependency in _dependencies!) {
        dependency.removeListener(_update);
      }
    }

    // Set new dependencies and add listeners
    _dependencies = newDependencies;
    if (_dependencies != null && _dependencies!.isNotEmpty) {
      for (var dependency in _dependencies!) {
        dependency.addListener(_update);
      }
    }

    _isInitialized = true;
  }

  @override
  void dispose() {
    if (_dependencies != null) {
      for (var dependency in _dependencies!) {
        dependency.removeListener(_update);
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // If not initialized, track dependencies first
    if (!_isInitialized) {
      _trackDependencies();
    }

    // Execute the builder function
    return widget.builder();
  }

  void _update() {
    if (mounted) {
      setState(() {
        // Re-track dependencies on each update to handle dynamic dependencies
        _trackDependencies();
      });
    }
  }
}
