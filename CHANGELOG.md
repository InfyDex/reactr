# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.9] - 2024-01-XX

### Fixed
- Fixed Dart formatting issues in `rc_list.dart` and `multi_react.dart`
- Improved code style consistency across the package

## [0.2.8] - 2024-01-XX

### Changed
- Updated dependencies to latest compatible versions
- Improved package documentation and examples

## [0.2.7] - 2024-01-XX

### Added
- **ReactrMaterialApp**: Drop-in replacement for MaterialApp with enhanced features
- **ReactrStorage**: Synchronous wrapper around SharedPreferences for persistent storage
- **Animation Support**: ReactrSingleTickerProviderStateMixin and ReactrTickerProviderStateMixin
- **Navigation Utilities**: Enhanced navigation with automatic controller lifecycle management
- **UI Utilities**: SnackBar and BottomSheet helpers
- **Route Observer**: Automatic binding management for navigation
- **Reactive Data Types**: Complete set of reactive types (RcInt, RcString, RcBool, etc.)
- **Nullable Reactive Types**: Rcn variants for nullable values
- **MultiReact Widget**: Widget for listening to multiple reactive variables
- **Dependency Injection**: Service locator with singleton and lazy singleton support
- **Logger**: Built-in logging system for debugging

### Changed
- **React Widget**: Deprecated in favor of MultiReact for better performance
- **Controller Lifecycle**: Enhanced with onInit, onReady, and onClose methods
- **Reactive System**: Improved dependency tracking and UI updates

### Fixed
- Memory leaks in controller disposal
- Navigation state management issues
- Reactive variable cleanup

## [0.2.0] - 2024-01-XX

### Added
- **Core Reactive System**: Rc<T> base class for reactive state management
- **Controller Architecture**: ReactrController base class with lifecycle methods
- **View System**: ReactrView for connecting controllers to UI
- **Binding System**: ReactrBinding for dependency injection management
- **Basic Navigation**: Reactr.to and Reactr.toNamed methods
- **Context Management**: Global context access through Reactr.context

### Changed
- Complete rewrite of the library architecture
- Improved performance and memory management

## [0.1.1] - 2024-01-XX

### Added
- `RcBool` and `RcDouble` classes for reactive boolean and double values
- Updated documentation and examples

## [0.1.0] - 2024-01-XX

### Added
- Initial release of Reactr
- Basic reactive state management
- Controller-based architecture
- Simple navigation system