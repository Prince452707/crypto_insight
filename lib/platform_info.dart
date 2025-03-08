import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

/// Utility class to detect the current platform
class PlatformInfo {
  /// Returns true if the app is running on the web
  static bool get isWeb => kIsWeb;

  /// Returns true if the app is running on iOS
  static bool get isIOS => !isWeb && Platform.isIOS;

  /// Returns true if the app is running on Android
  static bool get isAndroid => !isWeb && Platform.isAndroid;

  /// Returns true if the app is running on macOS
  static bool get isMacOS => !isWeb && Platform.isMacOS;

  /// Returns true if the app is running on Windows
  static bool get isWindows => !isWeb && Platform.isWindows;

  /// Returns true if the app is running on Linux
  static bool get isLinux => !isWeb && Platform.isLinux;

  /// Returns true if the app is running on a mobile device
  static bool get isMobile => isAndroid || isIOS;

  /// Returns true if the app is running on a desktop device
  static bool get isDesktop => isMacOS || isWindows || isLinux;
}