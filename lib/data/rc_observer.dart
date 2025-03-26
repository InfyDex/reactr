import 'package:reactr/reactr.dart';

class RcObserver {
  static final threadLocal = _ThreadLocal<Set<Rc>>();

  static void startTracking() {
    threadLocal.value = {};
  }

  static Set<Rc>? endTracking() {
    final dependencies = threadLocal.value;
    threadLocal.value = null;
    return dependencies;
  }

  static void track(Rc rc) {
    threadLocal.value?.add(rc);
  }
}

class _ThreadLocal<T> {
  T? value;
}
