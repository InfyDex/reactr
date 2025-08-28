# Reactr Example App

This is a comprehensive example demonstrating the features and usage of the Reactr state management library for Flutter.

## Features Demonstrated

- **Reactive State Management**: Using `RcInt` for reactive counter values
- **Controller Lifecycle**: Proper initialization and disposal of controllers
- **Navigation**: Navigation between screens with automatic controller management
- **UI Utilities**: SnackBars and BottomSheets using Reactr utilities
- **Multiple Reactive Variables**: Using `MultiReact` widget to listen to multiple reactive values
- **Binding System**: Dependency injection with automatic cleanup

## Getting Started

1. Make sure you have Flutter installed and set up
2. Navigate to the example directory: `cd example`
3. Run the app: `flutter run`

## App Structure

```
lib/
├── main.dart                 # App entry point with ReactrMaterialApp
└── module/
    └── counter/
        ├── bindings/
        │   └── counter_binding.dart    # Controller binding
        ├── controllers/
        │   └── counter_controller.dart  # Business logic
        └── views/
            ├── counter_view.dart        # Main counter screen
            └── test_bottom_sheet.dart   # Bottom sheet example
```

## Key Components

### CounterController
- Manages two reactive counters using `RcInt`
- Demonstrates controller lifecycle methods (`onInit`, `onClose`)
- Shows how to update reactive values

### CounterBinding
- Handles dependency injection for the counter controller
- Automatically creates and disposes the controller with navigation

### CounterView
- Uses `MultiReact` widget to listen to multiple reactive variables
- Demonstrates navigation, SnackBars, and BottomSheets
- Shows proper widget structure with Reactr

## Try It Out

1. **Counter Functionality**: Tap the + and safety check buttons to increment counters
2. **Bottom Sheet**: Tap "Open Bottom Sheet" to see a modal bottom sheet
3. **SnackBar**: Tap "Show SnackBar" to display a snackbar message
4. **Navigation**: The app starts with a home screen that navigates to the counter

This example serves as a reference implementation for using Reactr in your own Flutter applications.
