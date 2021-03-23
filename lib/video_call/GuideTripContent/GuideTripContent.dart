import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/trip_content/components/main_screen.dart';

class GuideTripContent extends StatelessWidget {
  const GuideTripContent({
    Key key,
    this.id
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainContent(
          id:this.id
      ),
    );
  }
}