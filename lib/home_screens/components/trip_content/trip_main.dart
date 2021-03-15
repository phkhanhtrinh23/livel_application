import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/trip_content/components/main_screen.dart';

class TripContent extends StatelessWidget {
  const TripContent({
    Key key,
    this.country,
    this.place,
    this.image,
    this.day,
    this.cost,
    this.duration,
  }) : super(key: key);

  final String country, place, image, day;
  final int cost, duration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainContent(
        country: country,
        place: place,
        image: image,
        day: day,
        cost: cost,
        duration: duration,
      ),
    );
  }
}
