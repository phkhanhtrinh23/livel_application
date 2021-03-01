import 'package:flutter/material.dart';
import 'package:livel_application/splash_screens/second_screen.dart';
import 'package:livel_application/splash_screens/third_screen.dart';

class PageViewing extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: _pageController,
      children: [
        SecondScreen(),
        ThirdScreen(),
      ],
    ));
  }
}
