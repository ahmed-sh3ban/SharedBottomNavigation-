import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  final List<String> _pageKeys = ["Page1", "Page2", "Page3"];
  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
  };

  int _selectedIndex = 0;
  String _currentPage = "Page1";

  int get selectedIndex => _selectedIndex;

  String get currentPage => _currentPage;

  List<String> get pageKeys => _pageKeys;

  Map<String, GlobalKey<NavigatorState>> get navigatorKeys => _navigatorKeys;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    _currentPage = _pageKeys[index];
    notifyListeners();
  }

  GlobalKey<NavigatorState>? getNavigatorState(String pageName) {
    return _navigatorKeys[pageName];
  }

  GlobalKey<NavigatorState>? getCurrentNavigatorState() {
    return _navigatorKeys[_currentPage];
  }
}
