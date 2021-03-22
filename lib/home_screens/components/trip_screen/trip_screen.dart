import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/trip_screen/components/each_place.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({
    Key key,
    this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 24, bottom: 16),
              width: _width,
              height: 148,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: Color(0xFF5197E1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    'Explore',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                top: 35,
                bottom: 23,
                left: 21,
              ),
              child: Text(
                'Welcome to $name',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFFEE6C4D),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            PlaceScreen(
              image: 'images/market.png',
              cost: 9,
              time: 18,
              date: 'March 16, 2021',
              place: 'Title',
            ),
            PlaceScreen(
              image: 'images/market.png',
              cost: 9,
              time: 18,
              date: 'March 16, 2021',
              place: 'Title',
            ),
            PlaceScreen(
              image: 'images/market.png',
              cost: 9,
              time: 18,
              date: 'March 16, 2021',
              place: 'Title',
            ),
            PlaceScreen(
              image: 'images/market.png',
              cost: 9,
              time: 18,
              date: 'March 16, 2021',
              place: 'Title',
            ),
            PlaceScreen(
              image: 'images/market.png',
              cost: 9,
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
