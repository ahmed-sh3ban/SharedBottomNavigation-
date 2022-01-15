import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sharednavigationbuttom/sharedBottomNavigaton/navigator/navigator.dart';
import 'package:sharednavigationbuttom/sharedComponents/portal/portal.dart';

class CustomNavigatorRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings, Widget child, String defaultTitle) {
    final args = settings.arguments;
    print(settings.name);
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(
              builder: (_) => Portal(title: defaultTitle, child: child));
        }

      case '/page-one':
        {
          return MaterialPageRoute(
              builder: (_) => const Portal(title: "Page1", child: Page1()));
        }
      case '/page-two':
        {
          return MaterialPageRoute(
              builder: (_) => const Portal(title: "Page2", child: Page2()));
        }
      case '/page-three':
        {
          return MaterialPageRoute(
              builder: (_) => const Portal(title: "Page3", child: Page3()));
        }
      case '/page-four':
        {
          return MaterialPageRoute(
              builder: (_) => const Portal(title: "Page4", child: Page4()));
        }
    }
    return MaterialPageRoute(builder: (_) => const Page1());
  }
}
