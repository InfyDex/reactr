import 'package:flutter/material.dart';
import 'package:reactr/bindings/reactr_binding.dart';

class ReactrRouteObserver extends NavigatorObserver {
  // Store active bindings with their route
  static final Map<Route<dynamic>, ReactrBinding> _activeBindings = {};

  // Register a binding with a route
  static void registerBinding(Route<dynamic> route, ReactrBinding binding) {
    _activeBindings[route] = binding;
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    // Call onBind() for the binding associated with this route
    if (_activeBindings.containsKey(route)) {
      final binding = _activeBindings[route];
      binding?.onBind();
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _cleanupBinding(route);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _cleanupBinding(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (oldRoute != null) {
      _cleanupBinding(oldRoute);
    }
  }

  // Clean up binding for a route
  static void _cleanupBinding(Route<dynamic> route) {
    if (_activeBindings.containsKey(route)) {
      final binding = _activeBindings[route];
      binding?.unBind();
      _activeBindings.remove(route);
    }
  }
}
