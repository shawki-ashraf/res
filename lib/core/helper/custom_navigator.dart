import 'package:flutter/material.dart';

enum NavigationType { push, pushReplacement, pushAndRemoveUntil }

abstract class CustomNavigator {
  static Future<dynamic> goTo(
    BuildContext context,
    Widget distination, {
    NavigationType type = NavigationType.push,
  }) {
    var pageRoute = MaterialPageRoute(builder: (_) => distination);
    switch (type) {
      case NavigationType.push:
        return Navigator.push(context, pageRoute);

      case NavigationType.pushReplacement:
        return Navigator.pushReplacement(context, pageRoute);

      case NavigationType.pushAndRemoveUntil:
        return Navigator.pushAndRemoveUntil(
          context,
          pageRoute,
          (route) => false,
        );
    }
  }
}
