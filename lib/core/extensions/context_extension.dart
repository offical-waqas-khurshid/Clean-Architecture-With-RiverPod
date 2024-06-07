import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  /// Navigate to a new route
  void navigateTo(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  /// Navigate to a new route and remove all the previous routes
  void navigateAndReplace(String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  /// Navigate to a new route and remove all the previous routes until the predicate returns true
  void navigateAndRemoveUntil(String newRouteName, RoutePredicate predicate, {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(this, newRouteName, predicate, arguments: arguments);
  }

  /// Pop the current route
  void pop([Object? result]) {
    Navigator.pop(this, result);
  }

  /// Get localized strings
  // Get localized strings
  String getLocalizedString(String key) {
    return tr(key);
  }
}
