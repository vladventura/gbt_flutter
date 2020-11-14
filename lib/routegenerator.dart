import 'package:flutter/material.dart';
import 'package:gbt_flutter/pages/errorpage.dart';
import 'package:gbt_flutter/pages/homepage.dart';
import 'package:gbt_flutter/pages/selectedgamepage.dart';

class RouteGenerator {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => HomePage());
      case "/selectedGame":
        return MaterialPageRoute(builder: (_) => SelectedGamePage());
      case "/error":
      default:
        return MaterialPageRoute(builder: (_) => ErrorPage());
    }
  }
}
