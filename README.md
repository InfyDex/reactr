# Reactr

Reactr is a state management library for Flutter applications. It provides a simple and efficient way to manage the state of your application using controllers and bindings.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  reactr:
    git:
      url: https://github.com/your-repo/reactr.git
      ref: main
```

Then, run `flutter pub get` to install the package.

## Usage

### Creating a Controller

Create a controller by extending `ReactrController`:

```dart
import 'package:reactr/reactr.dart';

class CounterController extends ReactrController {
  var count = Rc<int>(0);

  @override
  void onInit() {
    super.onInit();
    // Initialization code
  }

  void increment() {
    count.value++;
  }

  @override
  void onClose() {
    super.onClose();
    // Clean up resources
  }
}
```

### Creating a View

Create a view by extending `ReactrView` and using the controller:

```dart
import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';

class CounterView extends ReactrView<CounterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: React<int>(
          notifier: controller.count.notifier,
          builder: (context, count) {
            return Text('Count: $count');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

### Registering the Controller

Register the controller using `putSingleton` or `putLazySingleton`:

```dart
void main() {
  Reactr.putSingleton(CounterController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterView(),
    );
  }
}
```

### Navigation

Use `Reactr.to` or `Reactr.toNamed` for navigation:

```dart
Reactr.to<CounterController>(
context: context,
binding: CounterBinding(),
builder: () => CounterView(),
);
```

### Example

Here is a complete example:

```dart
import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';

void main() {
  Reactr.putSingleton(CounterController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterView(),
    );
  }
}

class CounterController extends ReactrController {
  var count = Rc<int>(0);

  @override
  void onInit() {
    super.onInit();
    // Initialization code
  }

  void increment() {
    count.value++;
  }

  @override
  void onClose() {
    super.onClose();
    // Clean up resources
  }
}

class CounterView extends ReactrView<CounterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: React<int>(
          notifier: controller.count.notifier,
          builder: (context, count) {
            return Text('Count: $count');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

This example demonstrates how to set up a simple counter application using Reactr for state management.