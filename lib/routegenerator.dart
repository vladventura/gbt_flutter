import 'package:flutter/material.dart';
import 'package:gbt_flutter/pages/homepage.dart';

class RouteGenerator {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
