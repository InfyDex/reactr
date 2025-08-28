# Reactr

[![Pub Version](https://img.shields.io/pub/v/reactr)](https://pub.dev/packages/reactr)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

Reactr is a powerful and lightweight state management library for Flutter applications. It provides a simple, efficient, and reactive way to manage application state using controllers, bindings, and reactive data types. Built with performance and developer experience in mind, Reactr offers automatic dependency tracking, lifecycle management, and seamless integration with Flutter's widget system.

## ✨ Features

- **🔄 Reactive State Management**: Automatic dependency tracking and UI updates
- **🎯 Controller-Based Architecture**: Clean separation of business logic and UI
- **🔗 Dependency Injection**: Built-in service locator with singleton and lazy singleton support
- **🧭 Navigation Management**: Simplified navigation with automatic controller lifecycle management
- **💾 Persistent Storage**: Synchronous storage wrapper with SharedPreferences
- **🎨 UI Utilities**: SnackBars, BottomSheets, and other UI helpers
- **⚡ Performance Optimized**: Efficient reactive updates with minimal rebuilds
- **🛠️ Animation Support**: Built-in ticker providers for animations
- **📱 Flutter Material App**: Drop-in replacement with enhanced features

## 📦 Installation

Add Reactr to your `pubspec.yaml`:

```yaml
dependencies:
  reactr: ^0.2.7
```

Then run:
```bash
flutter pub get
```

## 🚀 Quick Start

### 1. Setup Your App

Replace your `MaterialApp` with `ReactrMaterialApp`:

```dart
import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactrMaterialApp(
      title: 'Reactr Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
```

### 2. Create a Controller

```dart
import 'package:reactr/reactr.dart';

class CounterController extends ReactrController {
  // Reactive variables
  final count = RcInt(0);
  final name = RcString('Reactr');
  final isVisible = RcBool(true);
  
  // Nullable reactive variables
  final optionalValue = RcnString(null);

  @override
  void onInit() {
    super.onInit();
    // Initialize your controller
    print('CounterController initialized');
  }

  void increment() {
    count.value++;
  }

  void decrement() {
    count.value--;
  }

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }

  @override
  void onClose() {
    super.onClose();
    // Clean up resources
    print('CounterController disposed');
  }
}
```

### 3. Create a Binding

```dart
import 'package:reactr/reactr.dart';
import 'counter_controller.dart';

class CounterBinding extends ReactrBinding {
  @override
  void onBind() {
    // Register controller when route is pushed
    Reactr.putLazySingleton(() => CounterController());
  }

  @override
  void unBind() {
    // Clean up controller when route is popped
    Reactr.remove<CounterController>();
  }
}
```

### 4. Create a View

```dart
import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';
import 'counter_controller.dart';

class CounterView extends ReactrView<CounterController> {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Reactive widget that automatically tracks all used variables
            React(
              () => Text(
                'Count: ${controller.count.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: controller.decrement,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: controller.increment,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Multi-reactive widget
            MultiReact(
              values: [controller.count, controller.isVisible],
              builder: (values) {
                final count = values[0] as int;
                final isVisible = values[1] as bool;
                return isVisible 
                  ? Text('Visible count: $count')
                  : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

### 5. Navigation

```dart
// Navigate to a new screen
ElevatedButton(
  onPressed: () => Reactr.to(
    binding: CounterBinding(),
    builder: () => const CounterView(),
  ),
  child: const Text('Open Counter'),
),

// Navigate with named route
ElevatedButton(
  onPressed: () => Reactr.toNamed(
    binding: CounterBinding(),
    routeName: '/counter',
  ),
  child: const Text('Open Counter (Named)'),
),

// Replace current screen
Reactr.replace(
  binding: CounterBinding(),
  builder: () => const CounterView(),
),

// Navigate and clear stack
Reactr.replaceUntil(
  binding: CounterBinding(),
  builder: () => const CounterView(),
  predicate: (route) => false, // Clear all routes
),
```

## 📚 Core Concepts

### Reactive Data Types

Reactr provides several reactive data types that automatically trigger UI updates when their values change:

#### Basic Types
- `Rc<T>` - Generic reactive container
- `RcInt` - Reactive integer
- `RcDouble` - Reactive double
- `RcString` - Reactive string
- `RcBool` - Reactive boolean
- `RcList<T>` - Reactive list
- `RcMap<K, V>` - Reactive map

#### Nullable Types
- `Rcn<T>` - Generic nullable reactive container
- `RcnInt` - Nullable reactive integer
- `RcnDouble` - Nullable reactive double
- `RcnString` - Nullable reactive string
- `RcnBool` - Nullable reactive boolean

```dart
class MyController extends ReactrController {
  final count = RcInt(0);
  final name = RcString('Hello');
  final items = RcList<String>(['item1', 'item2']);
  final settings = RcMap<String, dynamic>({'theme': 'dark'});
  final optionalValue = RcnString(null);
  
  void updateData() {
    count.value++;
    name.value = 'Updated';
    items.value.add('item3');
    settings.value['theme'] = 'light';
    optionalValue.value = 'Now has value';
  }
}
```

### Reactive Widgets

#### React Widget
The `React` widget automatically tracks and rebuilds when any reactive variable used within it changes. It's the simplest way to create reactive UI components:

```dart
React(
  () => Text('Count: ${controller.count.value}'),
)
```

The `React` widget automatically detects which reactive variables are accessed within the builder function and subscribes to their changes. This means you don't need to manually specify which variables to watch - it happens automatically!

**Key Features:**
- **Automatic Dependency Tracking**: No need to manually specify which variables to watch
- **Dynamic Dependencies**: Automatically handles changes in dependencies during runtime
- **Memory Efficient**: Properly manages listeners to prevent memory leaks
- **Simple API**: Just wrap your widget with `React(() => YourWidget())`

**Example with Multiple Variables:**
```dart
React(() {
  return Column(
    children: [
      Text('Count: ${controller.count.value}'),
      Text('Name: ${controller.name.value}'),
      if (controller.isVisible.value)
        Text('This is visible!'),
    ],
  );
})
```

This widget will automatically rebuild whenever `controller.count.value`, `controller.name.value`, or `controller.isVisible.value` changes.

#### MultiReact Widget
The `MultiReact` widget can listen to multiple reactive variables. This is useful when you need explicit control over which variables to watch or when you want to access the values as a list:

```dart
MultiReact(
  values: [controller.count, controller.name, controller.isVisible],
  builder: (values) {
    final count = values[0] as int;
    final name = values[1] as String;
    final isVisible = values[2] as bool;
    
    return isVisible 
      ? Text('$name: $count')
      : const SizedBox.shrink();
  },
)
```

**When to use React vs MultiReact:**
- **Use `React`** when you want automatic dependency tracking and don't need to access values as a list
- **Use `MultiReact`** when you need explicit control over which variables to watch or want to access values as a list

### Controller Lifecycle

Controllers have three lifecycle methods:

```dart
class MyController extends ReactrController {
  @override
  void onInit() {
    super.onInit();
    // Called when controller is created
    // Initialize variables, load data, etc.
  }

  @override
  void onReady() {
    super.onReady();
    // Called after the first frame is rendered
    // Good place for post-frame initialization
  }

  @override
  void onClose() {
    super.onClose();
    // Called when controller is disposed
    // Clean up resources, cancel subscriptions, etc.
  }
}
```

### Dependency Injection

Reactr provides a simple dependency injection system:

```dart
// Register a singleton
Reactr.putSingleton(MyController());

// Register a lazy singleton
Reactr.putLazySingleton(() => MyController());

// Check if registered
if (Reactr.contains<MyController>()) {
  // Controller is registered
}

// Get controller instance
final controller = Reactr.find<MyController>();

// Remove controller
Reactr.remove<MyController>();
```

## 🎨 UI Utilities

### SnackBars

```dart
Reactr.snackBar(
  content: const Text('This is a snackbar'),
  backgroundColor: Colors.green,
  duration: const Duration(seconds: 3),
  action: SnackBarAction(
    label: 'Undo',
    onPressed: () => print('Undo pressed'),
  ),
);
```

### Bottom Sheets

```dart
Reactr.bottomSheet(
  builder: (context) => Container(
    height: 200,
    child: const Center(
      child: Text('This is a bottom sheet'),
    ),
  ),
  isScrollControlled: true,
  backgroundColor: Colors.white,
);
```

### Context and Media Queries

```dart
// Get context
final context = Reactr.context;

// Check if dark mode
if (Reactr.isDarkMode) {
  // Dark mode is active
}

// Get screen dimensions
final width = Reactr.width;
final height = Reactr.height;

// Get navigation arguments
final args = Reactr.arguments;
```

## 💾 Storage

ReactrStorage provides a synchronous wrapper around SharedPreferences:

```dart
class UserController extends ReactrController {
  final username = RcString('');
  
  @override
  void onInit() {
    super.onInit();
    // Load saved username
    username.value = ReactrStorage.getString('username') ?? '';
  }
  
  void saveUsername(String name) {
    username.value = name;
    ReactrStorage.setString('username', name);
  }
  
  void clearData() {
    ReactrStorage.remove('username');
    username.value = '';
  }
}
```

### Storage Methods

```dart
// String operations
ReactrStorage.setString('key', 'value');
String? value = ReactrStorage.getString('key');

// Number operations
ReactrStorage.setInt('count', 42);
int? count = ReactrStorage.getInt('count');

ReactrStorage.setDouble('price', 19.99);
double? price = ReactrStorage.getDouble('price');

// Boolean operations
ReactrStorage.setBool('isLoggedIn', true);
bool? isLoggedIn = ReactrStorage.getBool('isLoggedIn');

// List operations
ReactrStorage.setStringList('tags', ['flutter', 'dart']);
List<String>? tags = ReactrStorage.getStringList('tags');

// Utility methods
ReactrStorage.remove('key');
bool hasKey = ReactrStorage.containsKey('key');
Set<String> keys = ReactrStorage.getKeys();
ReactrStorage.clear();
```

## 🎭 Animations

Reactr provides mixins for animation support in controllers:

### Single Animation Controller

```dart
class AnimatedController extends ReactrController 
    with ReactrSingleTickerProviderStateMixin {
  
  late AnimationController animationController;
  late Animation<double> animation;
  
  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
  }
  
  void startAnimation() {
    animationController.forward();
  }
  
  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
```

### Multiple Animation Controllers

```dart
class MultiAnimatedController extends ReactrController 
    with ReactrTickerProviderStateMixin {
  
  late AnimationController fadeController;
  late AnimationController slideController;
  
  @override
  void onInit() {
    super.onInit();
    fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }
  
  @override
  void onClose() {
    fadeController.dispose();
    slideController.dispose();
    super.onClose();
  }
}
```

## 🔧 Advanced Usage

### Custom Reactive Types

You can create custom reactive types by extending `Rc`:

```dart
class RcUser extends Rc<User> {
  RcUser(super.value);
  
  void updateName(String name) {
    value = value.copyWith(name: name);
  }
  
  bool get isAdult => value.age >= 18;
}
```

### Route Arguments

Pass data between screens:

```dart
// Navigate with arguments
Reactr.to(
  binding: UserBinding(),
  builder: () => const UserView(),
  arguments: {'userId': 123, 'action': 'edit'},
);

// Access arguments in controller
class UserController extends ReactrController {
  @override
  void onInit() {
    super.onInit();
    final args = Reactr.arguments as Map<String, dynamic>?;
    final userId = args?['userId'] as int?;
    if (userId != null) {
      loadUser(userId);
    }
  }
}
```

### Global State Management

For global state that persists across routes:

```dart
class GlobalController extends ReactrController {
  final currentUser = Rc<User?>(null);
  final theme = RcString('light');
  
  void setTheme(String newTheme) {
    theme.value = newTheme;
    ReactrStorage.setString('theme', newTheme);
  }
}

// Register globally in main()
void main() {
  Reactr.putSingleton(GlobalController());
  runApp(const MyApp());
}
```

## 📱 Example App

Check out the complete example in the `example/` directory:

```bash
cd example
flutter run
```

The example demonstrates:
- Basic counter functionality
- Navigation between screens
- SnackBars and BottomSheets
- Multiple reactive variables
- Controller lifecycle management

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Links

- [Pub Package](https://pub.dev/packages/reactr)
- [GitHub Repository](https://github.com/InfyDex/reactr)
- [Documentation](https://pub.dev/documentation/reactr)

---

Made with ❤️ for the Flutter community