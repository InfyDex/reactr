import 'package:reactr/reactr.dart';

class CounterController extends ReactrController {
  final count = RcInt(-1);
  final count1 = RcInt(0);
  final isVisible = RcBool(true);

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

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }
}
