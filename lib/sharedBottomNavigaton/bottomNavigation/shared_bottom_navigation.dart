import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sharednavigationbuttom/model/provider/bottom_navigation_provider.dart';
import 'package:sharednavigationbuttom/sharedBottomNavigaton/navigator/navigator.dart';


class SharedBottomNavigation extends StatefulWidget {
  const SharedBottomNavigation({Key? key}) : super(key: key);

  @override
  _SharedBottomNavigationState createState() => _SharedBottomNavigationState();
}

class _SharedBottomNavigationState extends State<SharedBottomNavigation> {
  void _selectTab(String tabItem, int index) {
    if (tabItem == context.read<BottomNavigationProvider>().currentPage) {
      context
          .read<BottomNavigationProvider>()
          .getNavigatorState(tabItem)!
          .currentState!
          .popUntil((route) => route.isFirst);
    } else {
      context.read<BottomNavigationProvider>().setSelectedIndex(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await context
            .read<BottomNavigationProvider>()
            .getCurrentNavigatorState()!
            .currentState!
            .maybePop();
        if (isFirstRouteInCurrentTab) {
          if (context.read<BottomNavigationProvider>().currentPage !=
              context.read<BottomNavigationProvider>().pageKeys[0]) {
            _selectTab(context.read<BottomNavigationProvider>().pageKeys[0], 0);
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(
              context.read<BottomNavigationProvider>().pageKeys[0]),
          _buildOffstageNavigator(
              context.read<BottomNavigationProvider>().pageKeys[1]),
          _buildOffstageNavigator(
              context.read<BottomNavigationProvider>().pageKeys[2]),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent,
          onTap: (int index) {
            _selectTab(context.read<BottomNavigationProvider>().pageKeys[index],
                index);
          },
          currentIndex: context.watch<BottomNavigationProvider>().selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.looks_one),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.looks_two),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.looks_3),
              label: "",
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: context.read<BottomNavigationProvider>().currentPage != tabItem,
      child: TabNavigator(
        navigatorKey:
            context.read<BottomNavigationProvider>().getNavigatorState(tabItem),
        tabItem: tabItem,
      ),
    );
  }
}
