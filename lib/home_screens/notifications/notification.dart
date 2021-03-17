import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/notifications/components/main_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    Key key,
    this.place,
  });

  final String place;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(
                bottom: 21,
              ),
              width: _width,
              height: 148,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: Color(0xFF5197E1),
              ),
              child: Text(
                'Notifications',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                top: 35,
                bottom: 23,
                left: 21,
              ),
              child: Text(
                'Your upcoming trips',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFFEE6C4D),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            UpcomingTripScreen(
              image: 'images/2.png',
              cost: 9,
              order: 1,
              time: 18,
              date: 'March 16, 2021',
              place: 'Title',
            ),
            UpcomingTripScreen(
              image: 'images/2.png',
              cost: 9,
              order: 2,
              time: 18,
              date: 'March 16, 2021',
              place: 'Title',
            ),
            UpcomingTripScreen(
              image: 'images/2.png',
              cost: 9,
              order: 3,
              time: 18,
              date: 'March 16, 2021',
              place: 'Title',
            ),
            UpcomingTripScreen(
              image: 'images/2.png',
              cost: 9,
              order: 3,
              time: 18,
              date: 'March 16, 2021',
              place: 'Title',
            ),
            UpcomingTripScreen(
              image: 'images/2.png',
              cost: 9,
              order: 4,
              time: 18,
              date: 'March 16, 2021',
              place: 'Title',
            ),
            UpcomingTripScreen(
              image: 'images/2.png',
              cost: 9,
              order: 5,
              time: 18,
              date: 'March 16, 2021',
              place: 'Title',
            ),
          ],
        ),
      ),
    );
  }
}
