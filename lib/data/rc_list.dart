import 'package:reactr/data/rc.dart';

class RcList<T> extends Rc<List<T>> {
  RcList(super.value);

  void assignAll(List<T> list) {
    value = list;
  }

  void addAll(List<T> list) {
    final temp = List<T>.from(value);
    temp.addAll(list);
    value = temp;
  }

  void add(T item) {
    final temp = List<T>.from(value);
    temp.add(item);
    value = temp;
  }

  void remove(T item) {
    final temp = List<T>.from(value);
    temp.remove(item);
    value = temp;
  }

  void removeAt(int index) {
    final temp = List<T>.from(value);
    temp.removeAt(index);
    value = temp;
  }

  void clear() {
    value = <T>[];
  }

  void insert(int index, T item) {
    final temp = List<T>.from(value);
    temp.insert(index, item);
    value = temp;
  }

  void insertAll(int index, List<T> items) {
    final temp = List<T>.from(value);
    temp.insertAll(index, items);
    value = temp;
  }

  void removeWhere(bool Function(T) test) {
    final temp = List<T>.from(value);
    temp.removeWhere(test);
    value = temp;
  }

  void retainWhere(bool Function(T) test) {
    final temp = List<T>.from(value);
    temp.retainWhere(test);
    value = temp;
  }

  void sort([int Function(T, T)? compare]) {
    final temp = List<T>.from(value);
    temp.sort(compare);
    value = temp;
  }

  void shuffle() {
    final temp = List<T>.from(value);
    temp.shuffle();
    value = temp;
  }

  void fillRange(int start, int end, [T? fillValue]) {
    final temp = List<T>.from(value);
    temp.fillRange(start, end, fillValue);
    value = temp;
  }

  void setAll(int index, List<T> items) {
    final temp = List<T>.from(value);
    temp.setAll(index, items);
    value = temp;
  }

  void setRange(int start, int end, Iterable<T> newContents,
      [int skipCount = 0]) {
    final temp = List<T>.from(value);
    temp.setRange(start, end, newContents, skipCount);
    value = temp;
  }

  void replaceRange(int start, int end, Iterable<T> newContents) {
    final temp = List<T>.from(value);
    temp.replaceRange(start, end, newContents);
    value = temp;
  }

  void removeRange(int start, int end) {
    final temp = List<T>.from(value);
    temp.removeRange(start, end);
    value = temp;
  }
}
