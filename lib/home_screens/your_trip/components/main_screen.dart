import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/trip_content/trip_main.dart';

class YourTripScreen extends StatelessWidget {
  const YourTripScreen({
    Key key,
    this.image,
    this.cost,
    this.date,
    this.place,
    this.time,
  });

  final String image, date, place;
  final int time, cost;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 16,
      ),
      height: 135,
      decoration: BoxDecoration(
        color: Color(0xFFDBEEFD),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TripContent(
                cost: cost,
                place: place,
                image: image,
                date: date,
                time: time,
              ),
            ),
          );
        },
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 32, left: 8),
              child: Image.asset(
                image,
                width: 111,
                height: 119,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$time am',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.blueAccent,
                      size: 15,
                    ),
                    Text(
                      '$date',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.blueAccent,
                      size: 15,
                    ),
                    Text(
                      '$place',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Text(
                  '\$$cost',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
