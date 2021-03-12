import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/your_trip/components/main_screen.dart';

class YourTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: _width,
                height: 148,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  color: Color(0xFF5197E1),
                ),
                child: Text(
                  'Your Trips',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 23,
                  left: 23,
                  top: 42,
                ),
                child: Row(
                  children: [
                    Icon(Icons.map_outlined),
                    Text(
                      'Complete Trips',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
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
