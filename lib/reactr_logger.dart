import 'dart:developer' as developer;

class ReactrLogger {
  static void log(message) {
    developer.log(message, name: 'REACTR', time: DateTime.now());
  }
}
