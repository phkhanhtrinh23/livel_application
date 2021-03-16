import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/trip_content/trip_main.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({
    Key key,
    this.image,
    this.cost,
    this.time,
    this.date,
    this.place,
    this.country,
  });

  final String image, date, place, country;
  final int cost, time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 22,
        right: 28,
        bottom: 12,
      ),
      width: 330,
      height: 178,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: FlatButton(
        padding: const EdgeInsets.all(0),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TripContent(
                cost: cost,
                country: country,
                place: place,
                date: date,
                time: time,
                image: image,
              ),
            ),
          );
        },
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: 52,
                height: 32,
                decoration: BoxDecoration(
                  color: Color(0xFF5197E1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                ),
                child: Text(
                  '\$$cost',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.only(
                  left: 14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$time:00',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '$date',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '$place',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
