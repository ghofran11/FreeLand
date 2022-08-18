import 'package:flutter/widgets.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _index = 0;
  final PageController pageController = PageController(initialPage: 0);

  set index(int index) {
    _index = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    notifyListeners();
  }

  int get index => _index;
}
