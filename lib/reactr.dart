export 'package:reactr/bindings/reactr_binding.dart';
export 'package:reactr/controllers/reactr_controller.dart';
export 'package:reactr/data/rc.dart';
export 'package:reactr/data/rc_bool.dart';
export 'package:reactr/data/rc_double.dart';
export 'package:reactr/data/rc_int.dart';
export 'package:reactr/data/rc_list.dart';
export 'package:reactr/data/rc_map.dart';
export 'package:reactr/data/rc_string.dart';
export 'package:reactr/data/rcn_bool.dart';
export 'package:reactr/widgets/react.dart';
export 'package:reactr/widgets/reactr_view.dart';
export 'package:reactr/reactr.dart';
export 'package:reactr/reactr_material_app.dart';
import 'package:flutter/material.dart';
import 'package:reactr/bindings/reactr_binding.dart';
import 'package:reactr/controllers/reactr_controller.dart';
import 'package:reactr/reactr_logger.dart';
import 'package:reactr/widgets/reactr_view.dart';
import 'package:get_it/get_it.dart';

class Reactr {
  Reactr._privateConstructor();

  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static BuildContext get context => key.currentContext!;

  static void _callOnClose<T extends ReactrController>() {
    try {
      find<T>().onClose();
    } catch (e) {
      ReactrLogger.log(
        "❌ Error calling onClose of ${T.toString()} - ${e.toString()}",
      );
    }
  }

  static Object? get arguments => ModalRoute.of(context)!.settings.arguments;

  static Future<dynamic> toNamed<T extends ReactrController>({
    required ReactrBinding binding,
    required String routeName,
    Object? arguments,
  }) async {
    binding.onBind();
    final result = await Navigator.pushNamed(
      context,
      routeName,
      arguments: arguments,
    );
    _callOnClose<T>();
    binding.unBind();
    return result;
  }

  static Future<dynamic> to<T extends ReactrController>({
    required ReactrBinding binding,
    required ReactrView<T> Function() builder,
    Object? arguments,
  }) async {
    binding.onBind();
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => builder.call(),
        settings: RouteSettings(arguments: arguments),
      ),
    );
    _callOnClose<T>();
    binding.unBind();
    return result;
  }

  static void back({dynamic result}) {
    Navigator.pop(key.currentContext!, result);
  }

  static void _logCreated(String className) {
    ReactrLogger.log("🚀 Instance of '$className' is Created");
  }

  static void _logDestroyed(String className) {
    ReactrLogger.log("🔥 Instance of '$className' is Destroyed");
  }

  static T putSingleton<T extends Object>(T controller) {
    if (contains<T>()) return find<T>();
    _logCreated(T.toString());
    return GetIt.I.registerSingleton<T>(controller);
  }

  static void putLazySingleton<T extends Object>(FactoryFunc<T> builder) {
    if (contains<T>()) return;
    GetIt.I.registerLazySingleton<T>(
      () {
        _logCreated(T.toString());
        return builder.call();
      },
    );
  }

  static bool contains<T extends Object>() {
    return GetIt.I.isRegistered<T>();
  }

  static T find<T extends Object>() {
    return GetIt.I<T>();
  }

  static void remove<T extends Object>() {
    GetIt.I.unregister<T>();
    _logDestroyed(T.toString());
  }

  static Future<T?> bottomSheet<T>({
    required WidgetBuilder builder,
    Color? backgroundColor,
    String? barrierLabel,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    double scrollControlDisabledMaxHeightRatio = 9.0 / 16.0,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool? showDragHandle,
    bool useSafeArea = false,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
    AnimationStyle? sheetAnimationStyle,
  }) {
    return showModalBottomSheet(
      context: context,
      builder: builder,
      backgroundColor: backgroundColor,
      barrierLabel: barrierLabel,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      scrollControlDisabledMaxHeightRatio: scrollControlDisabledMaxHeightRatio,
      anchorPoint: anchorPoint,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
      showDragHandle: showDragHandle,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      sheetAnimationStyle: sheetAnimationStyle,
      transitionAnimationController: transitionAnimationController,
      useSafeArea: useSafeArea,
    );
  }
}
