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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.only(
              top: 35,
              bottom: 23,
              left: 21,
            ),
            child: Text(
              'Welcome to $name,\nchoose your virtual exeperience.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          PlaceScreen(
            image: 'images/1.png',
          ),
          PlaceScreen(
            image: 'images/2.png',
          ),
          PlaceScreen(
            image: 'images/3.png',
          ),
          PlaceScreen(
            image: 'images/2.png',
          ),
          PlaceScreen(
            image: 'images/1.png',
          ),
        ],
      ),
    );
  }
}
