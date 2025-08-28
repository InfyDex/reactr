import 'package:reactr/reactr.dart';

class CounterController extends ReactrController {
  final count = RcInt(-1);
  final count1 = RcInt(0);

  @override
  void onInit() {
    count.value = 0;
  }

  void increment() {
    count.value++;
  }

  void increment1() {
    count1.value++;
  }
}
