import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/trip_content/components/main_screen.dart';

class TripContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Content',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF5197E1),
      ),
      body: MainContent(),
    );
  }
}
