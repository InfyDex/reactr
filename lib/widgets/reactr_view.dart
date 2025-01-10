import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';

abstract class ReactrView<T extends ReactrController> extends StatelessWidget {
  const ReactrView({super.key});

  T get controller => Reactr.find<T>();
}
