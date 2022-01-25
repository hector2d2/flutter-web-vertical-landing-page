import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();
  final List<String> _pages = [
    'home',
    'about',
    'pricing',
    'contact',
    'location',
  ];
  int currentIndex = 0;

  void createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));
    document.title = _pages[getPageIndex(routeName)];
    scrollController.addListener(() {
      final pageIndex = (scrollController.page ?? 0).round();
      if (pageIndex != currentIndex) {
        document.title = _pages[pageIndex];
        window.history.pushState(null, '', '#/${_pages[pageIndex]}');
        currentIndex = pageIndex;
      }
    });
  }

  int getPageIndex(String routeName) =>
      !_pages.contains(routeName) ? 0 : _pages.indexOf(routeName);

  void goTo(int index) {
    scrollController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
