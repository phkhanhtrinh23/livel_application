import 'package:flutter/material.dart';
import 'package:livel_application/view/home_screens/components/trip_content/components/main_screen.dart';

class TripContent extends StatelessWidget {
  const TripContent({
    Key key,
    this.id,
    this.checkHomeScreen,
    this.list,
  }) : super(key: key);

  final String id, list;
  final bool checkHomeScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainContent(
        id: this.id,
        checkHomeScreen: this.checkHomeScreen,
        list: this.list,
      ),
    );
  }
}
