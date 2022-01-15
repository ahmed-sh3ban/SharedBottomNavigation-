import 'package:flutter/material.dart';
import 'package:sharednavigationbuttom/sharedBottomNavigaton/customNavigatorRoutes/custom_navigation_routes.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({Key? key, this.navigatorKey, this.tabItem})
      : super(key: key);
  final GlobalKey<NavigatorState>? navigatorKey;
  final String? tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child = const Page1();
    String defaultTitle = "Page1";

    if (tabItem == "Page1") {
      child = const Page1();
      defaultTitle = "page1";
    } else if (tabItem == "Page2") {
      child = const Page2();
      defaultTitle = "page2";
    } else if (tabItem == "Page3") {
      child = const Page3();
      defaultTitle = "page3";
    }

    return Navigator(
        key: navigatorKey,
        onGenerateRoute: (settings) =>
            CustomNavigatorRouteGenerator.generateRoute(
                settings, child, defaultTitle));
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/page-four");
            },
            child: const Text("Go to Page4")));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Page2"));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Page3"));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Page4"));
  }
}
