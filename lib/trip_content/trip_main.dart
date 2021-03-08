import 'package:flutter/material.dart';
import 'package:livel_application/trip_content/components/main_screen.dart';

class TripContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Content',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: MainContent(),
    );
  }
}
