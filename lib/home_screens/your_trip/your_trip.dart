import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/your_trip/components/main_screen.dart';

class YourTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Trips',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Color(0xFFDBE1FF),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              YourTripScreen(
                image: 'images/1.png',
              ),
              YourTripScreen(
                image: 'images/2.png',
              ),
              YourTripScreen(
                image: 'images/3.png',
              ),
              YourTripScreen(
                image: 'images/2.png',
              ),
              YourTripScreen(
                image: 'images/1.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
