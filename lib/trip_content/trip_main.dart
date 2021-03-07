import 'package:flutter/material.dart';
import 'package:livel_application/trip_content/components/main_screen.dart';

class TripContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainContent(),
    );
  }
}
