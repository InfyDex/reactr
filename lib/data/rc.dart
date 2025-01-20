import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';

class Rc<T> {
  final ValueNotifier<T> _value;

  Rc(T value) : _value = ValueNotifier<T>(value);

  T get value {
    RcObserver.track(this);
    return _value.value;
  }

  set value(T val) => _value.value = val;

  ValueNotifier<T> get notifier => _value;

  void setValue(T value) => _value.value = value;

  void refresh() => _value.notifyListeners();
}
