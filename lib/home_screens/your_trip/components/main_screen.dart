import 'package:flutter/material.dart';

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
        top: 16,
        left: 10,
        right: 10,
      ),
      width: 355,
      height: 135,
      decoration: BoxDecoration(
        color: Color(0xFFDBEEFD),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: FlatButton(
        onPressed: () {},
        child: Row(
          children: [
            Image.asset(
              image,
              width: 111,
              height: 119,
            ),
            Spacer(),
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
