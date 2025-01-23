import 'package:reactr/reactr.dart';

class CounterController extends ReactrController {
  final count = RcInt(-1);
  final count1 = RcInt(0);

  @override
  void onInit() {
    super.onInit();
    count.value = 0;
  }

  void increment() {
    count.value++;
  }

  void increment1() {
    count1.value++;
  }

  @override
  void onClose() {
    super.onClose();
    // dispose required variables
  }
}
