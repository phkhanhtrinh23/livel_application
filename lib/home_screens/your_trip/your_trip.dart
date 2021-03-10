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
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 23,
                  left: 23,
                  top: 42,
                ),
                child: Row(
                  children: [
                    Icon(Icons.map_outlined),
                    Spacer(),
                    Text(
                      'Complete Trips',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset('images/line.png'),
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
