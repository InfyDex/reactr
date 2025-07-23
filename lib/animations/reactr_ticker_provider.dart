import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:reactr/reactr.dart';

/// A mixin that provides a [TickerProvider] for a single [Ticker] for Reactr controllers.
///
/// This mixin is used to provide the [TickerProvider] functionality needed by
/// [AnimationController] when it's being used within a [ReactrController].
///
/// Example usage:
/// ```dart
/// class MyController extends ReactrController with ReactrSingleTickerProviderStateMixin {
///   late AnimationController animationController;
///
///   @override
///   void onInit() {
///     super.onInit();
///     animationController = AnimationController(
///       vsync: this,
///       duration: Duration(seconds: 1),
///     );
///   }
///
///   @override
///   void onClose() {
///     animationController.dispose();
///     super.onClose();
///   }
/// }
/// ```
mixin ReactrSingleTickerProviderStateMixin on ReactrController implements TickerProvider {
  Ticker? _ticker;

  @override
  Ticker createTicker(TickerCallback onTick) {
    assert(_ticker == null, 'A ReactrSingleTickerProviderStateMixin can only be used as a TickerProvider once.');
    _ticker = Ticker(onTick, debugLabel: 'created by $this');

    // We'll dispose the ticker in onClose
    return _ticker!;
  }

  void _disposeTicker() {
    if (_ticker != null) {
      _ticker!.dispose();
      _ticker = null;
    }
  }

  @override
  void onClose() {
    _disposeTicker();
    super.onClose();
  }
}

/// A mixin that provides a [TickerProvider] for multiple [Ticker]s for Reactr controllers.
///
/// This mixin is used to provide the [TickerProvider] functionality needed by
/// multiple [AnimationController]s when they're being used within a [ReactrController].
///
/// Example usage:
/// ```dart
/// class MyController extends ReactrController with ReactrTickerProviderStateMixin {
///   late AnimationController animationController1;
///   late AnimationController animationController2;
///
///   @override
///   void onInit() {
///     super.onInit();
///     animationController1 = AnimationController(
///       vsync: this,
///       duration: Duration(seconds: 1),
///     );
///     animationController2 = AnimationController(
///       vsync: this,
///       duration: Duration(seconds: 2),
///     );
///   }
///
///   @override
///   void onClose() {
///     animationController1.dispose();
///     animationController2.dispose();
///     super.onClose();
///   }
/// }
/// ```
mixin ReactrTickerProviderStateMixin on ReactrController implements TickerProvider {
  Set<Ticker>? _tickers;

  @override
  Ticker createTicker(TickerCallback onTick) {
    _tickers ??= <Ticker>{};
    final ticker = Ticker(onTick, debugLabel: 'created by $this');
    _tickers!.add(ticker);

    // We'll track and clean up the ticker in onClose
    return ticker;
  }

  void _disposeTickers() {
    if (_tickers != null) {
      for (final ticker in _tickers!) {
        ticker.dispose();
      }
      _tickers = null;
    }
  }

  @override
  void onClose() {
    _disposeTickers();
    super.onClose();
  }
}
