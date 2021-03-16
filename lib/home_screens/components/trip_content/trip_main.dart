import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/trip_content/components/main_screen.dart';

class TripContent extends StatelessWidget {
  const TripContent({
    Key key,
    this.country,
    this.place,
    this.image,
    this.date,
    this.cost,
    this.duration,
    this.time,
  }) : super(key: key);

  final String country, place, image, date;
  final int cost, duration, time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainContent(
        country: country,
        place: place,
        image: image,
        date: date,
        cost: cost,
        duration: duration,
        time: time,
      ),
    );
  }
}
