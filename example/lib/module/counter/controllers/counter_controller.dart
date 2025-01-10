import 'package:reactr/reactr.dart';

class CounterController extends ReactrController {
  final count = RcInt(-1);

  @override
  void onInit() {
    super.onInit();
    count.value = 0;
  }

  void increment() {
    count.value++;
  }

  @override
  void onClose() {
    super.onClose();
    // dispose required variables
  }
}
