import 'package:example/module/counter/controllers/counter_controller.dart';
import 'package:reactr/reactr.dart';

class CounterBinding extends ReactrBinding {
  @override
  void onBind() {
    Reactr.putLazySingleton(() => CounterController());
  }

  @override
  void unBind() {
    Reactr.remove<CounterController>();
  }
}
