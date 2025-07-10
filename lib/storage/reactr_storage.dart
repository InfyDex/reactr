import 'package:shared_preferences/shared_preferences.dart';

/// A synchronous wrapper around SharedPreferences for Reactr state management.
///
/// ReactrStorage provides synchronous getter and setter methods for persistent storage.
/// It must be initialized before use, typically in the ReactrMaterialApp.
class ReactrStorage {
  ReactrStorage._();

  static SharedPreferences? _prefs;
  static bool _isInitialized = false;

  /// Initializes the ReactrStorage with SharedPreferences instance.
  /// This should be called once at app startup, preferably in ReactrMaterialApp.
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _isInitialized = true;
  }

  /// Checks if ReactrStorage has been initialized.
  static bool get isInitialized => _isInitialized;

  /// Throws an exception if ReactrStorage is not initialized.
  static void _ensureInitialized() {
    if (!_isInitialized || _prefs == null) {
      throw StateError(
        'ReactrStorage is not initialized. Call ReactrStorage.init() first, '
        'preferably in your ReactrMaterialApp initialization.',
      );
    }
  }

  // String operations
  /// Gets a string value from storage.
  static String? getString(String key) {
    _ensureInitialized();
    return _prefs!.getString(key);
  }

  /// Sets a string value in storage synchronously.
  /// Note: The actual write to disk happens asynchronously in the background.
  static void setString(String key, String value) {
    _ensureInitialized();
    _prefs!.setString(key, value);
  }

  // Integer operations
  /// Gets an integer value from storage.
  static int? getInt(String key) {
    _ensureInitialized();
    return _prefs!.getInt(key);
  }

  /// Sets an integer value in storage synchronously.
  /// Note: The actual write to disk happens asynchronously in the background.
  static void setInt(String key, int value) {
    _ensureInitialized();
    _prefs!.setInt(key, value);
  }

  // Double operations
  /// Gets a double value from storage.
  static double? getDouble(String key) {
    _ensureInitialized();
    return _prefs!.getDouble(key);
  }

  /// Sets a double value in storage synchronously.
  /// Note: The actual write to disk happens asynchronously in the background.
  static void setDouble(String key, double value) {
    _ensureInitialized();
    _prefs!.setDouble(key, value);
  }

  // Boolean operations
  /// Gets a boolean value from storage.
  static bool? getBool(String key) {
    _ensureInitialized();
    return _prefs!.getBool(key);
  }

  /// Sets a boolean value in storage synchronously.
  /// Note: The actual write to disk happens asynchronously in the background.
  static void setBool(String key, bool value) {
    _ensureInitialized();
    _prefs!.setBool(key, value);
  }

  // String list operations
  /// Gets a string list from storage.
  static List<String>? getStringList(String key) {
    _ensureInitialized();
    return _prefs!.getStringList(key);
  }

  /// Sets a string list in storage synchronously.
  /// Note: The actual write to disk happens asynchronously in the background.
  static void setStringList(String key, List<String> value) {
    _ensureInitialized();
    _prefs!.setStringList(key, value);
  }

  // Utility methods
  /// Removes a value from storage synchronously.
  /// Note: The actual removal from disk happens asynchronously in the background.
  static void remove(String key) {
    _ensureInitialized();
    _prefs!.remove(key);
  }

  /// Checks if a key exists in storage.
  static bool containsKey(String key) {
    _ensureInitialized();
    return _prefs!.containsKey(key);
  }

  /// Gets all keys from storage.
  static Set<String> getKeys() {
    _ensureInitialized();
    return _prefs!.getKeys();
  }

  /// Clears all data from storage synchronously.
  /// Note: The actual clearing from disk happens asynchronously in the background.
  static void clear() {
    _ensureInitialized();
    _prefs!.clear();
  }

  /// Reloads the storage data from the platform.
  static Future<void> reload() async {
    _ensureInitialized();
    await _prefs!.reload();
  }

  // Additional methods that return Future for cases where you need to wait for completion
  /// Sets a string value and returns a Future that completes when the write is done.
  static Future<bool> setStringAsync(String key, String value) async {
    _ensureInitialized();
    return await _prefs!.setString(key, value);
  }

  /// Sets an integer value and returns a Future that completes when the write is done.
  static Future<bool> setIntAsync(String key, int value) async {
    _ensureInitialized();
    return await _prefs!.setInt(key, value);
  }

  /// Sets a double value and returns a Future that completes when the write is done.
  static Future<bool> setDoubleAsync(String key, double value) async {
    _ensureInitialized();
    return await _prefs!.setDouble(key, value);
  }

  /// Sets a boolean value and returns a Future that completes when the write is done.
  static Future<bool> setBoolAsync(String key, bool value) async {
    _ensureInitialized();
    return await _prefs!.setBool(key, value);
  }

  /// Sets a string list and returns a Future that completes when the write is done.
  static Future<bool> setStringListAsync(String key, List<String> value) async {
    _ensureInitialized();
    return await _prefs!.setStringList(key, value);
  }

  /// Removes a key and returns a Future that completes when the removal is done.
  static Future<bool> removeAsync(String key) async {
    _ensureInitialized();
    return await _prefs!.remove(key);
  }

  /// Clears all data and returns a Future that completes when the clearing is done.
  static Future<bool> clearAsync() async {
    _ensureInitialized();
    return await _prefs!.clear();
  }
}
