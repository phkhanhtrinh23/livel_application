import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/your_trip/components/main_screen.dart';

class YourTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: _width,
              height: 148,
              padding: const EdgeInsets.only(top: 24, bottom: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: Color(0xFF5197E1),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    'Your Trips',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
            ),
            YourTripScreen(
              image: 'images/rmit.png',
              time: 8,
              date: 'March 29, 2021',
              place: 'RMIT University, HCM City',
              cost: 9,
            ),
            YourTripScreen(
              image: 'images/rmit.png',
              time: 8,
              date: 'March 29, 2021',
              place: 'RMIT University, HCM City',
              cost: 9,
            ),
            YourTripScreen(
              image: 'images/rmit.png',
              time: 8,
              date: 'March 29, 2021',
              place: 'RMIT University, HCM City',
              cost: 9,
            ),
            YourTripScreen(
              image: 'images/rmit.png',
              time: 8,
              date: 'March 29, 2021',
              place: 'RMIT University, HCM City',
              cost: 9,
            ),
            YourTripScreen(
              image: 'images/rmit.png',
              time: 8,
              date: 'March 29, 2021',
              place: 'RMIT University, HCM City',
              cost: 9,
            ),
          ],
        ),
      ),
    );
  }
}
