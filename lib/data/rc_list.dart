import 'package:reactr/data/rc.dart';

class RcList<T> extends Rc<List<T>> {
  RcList(super.value);

  void assignAll(List<T> list) {
    value = list;
  }
}