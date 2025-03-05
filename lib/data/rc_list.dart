import 'package:reactr/data/rc.dart';

class RcList<T> extends Rc<List<T>> {
  RcList(super.value);

  void assignAll(List<T> list) {
    value = list;
  }

  void addAll(List<T> list) {
    value.addAll(list);
    refresh();
  }

  void add(T item) {
    value.add(item);
    refresh();
  }

  void remove(T item) {
    value.remove(item);
    refresh();
  }

  void removeAt(int index) {
    value.removeAt(index);
    refresh();
  }

  void clear() {
    value.clear();
    refresh();
  }

  void insert(int index, T item) {
    value.insert(index, item);
    refresh();
  }

  void insertAll(int index, List<T> items) {
    value.insertAll(index, items);
    refresh();
  }

  void removeWhere(bool Function(T) test) {
    value.removeWhere(test);
    refresh();
  }

  void retainWhere(bool Function(T) test) {
    value.retainWhere(test);
    refresh();
  }

  void sort([int Function(T, T)? compare]) {
    value.sort(compare);
    refresh();
  }

  void shuffle() {
    value.shuffle();
    refresh();
  }

  void fillRange(int start, int end, [T? fillValue]) {
    value.fillRange(start, end, fillValue);
    refresh();
  }

  void setAll(int index, List<T> items) {
    value.setAll(index, items);
    refresh();
  }

  void setRange(int start, int end, Iterable<T> newContents, [int skipCount = 0]) {
    value.setRange(start, end, newContents, skipCount);
    refresh();
  }

  void replaceRange(int start, int end, Iterable<T> newContents) {
    value.replaceRange(start, end, newContents);
    refresh();
  }

  void removeRange(int start, int end) {
    value.removeRange(start, end);
    refresh();
  }
}
