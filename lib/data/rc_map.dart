import 'package:reactr/data/rc.dart';

class RcMap<K, V> extends Rc<Map<K, V>> {
  RcMap(super.value);

  void assignAll(Map<K, V> map) {
    value = map;
  }

  void add(K key, V item) {
    value[key] = item;
    refresh();
  }

  void addAll(Map<K, V> map) {
    value.addAll(map);
    refresh();
  }

  void remove(K key) {
    value.remove(key);
    refresh();
  }

  void clear() {
    value.clear();
    refresh();
  }

  void removeWhere(bool Function(K, V) test) {
    value.removeWhere((key, value) => test(key, value));
    refresh();
  }
}
