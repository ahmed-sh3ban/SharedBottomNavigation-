
import 'package:flutter/material.dart';
import 'package:sharednavigationbuttom/sharedBottomNavigaton/bottomNavigation/shared_bottom_navigation.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(
              builder: (_) =>
                  Scaffold(body: SharedBottomNavigation()));
        }
    }
    return MaterialPageRoute(
        builder: (_) =>
            Scaffold(body: SharedBottomNavigation()));
  }
}
