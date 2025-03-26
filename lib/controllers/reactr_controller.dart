import 'package:flutter/material.dart';

abstract class ReactrController {
  ReactrController() {
    onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onReady();
    });
  }

  void onInit() {}

  void onClose() {}

  void onReady() {}
}
