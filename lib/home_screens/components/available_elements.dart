import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/trip_content/trip_main.dart';

class AvailableElement extends StatelessWidget {
  const AvailableElement({
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
    return Container(
      margin: const EdgeInsets.only(
        left: 8.0,
      ),
      padding: const EdgeInsets.only(
        right: 16.0,
        left: 8.0,
        bottom: 16.0,
      ),
      child: FlatButton(
        padding: const EdgeInsets.all(0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => TripContent(
                country: country,
                place: place,
                image: image,
                date: date,
                cost: cost,
                duration: duration,
                time: time,
              ),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              width: 249,
              height: 155,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                width: 52,
                height: 32,
                decoration: BoxDecoration(
                  color: Color(0xFF5197E1),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16.0),
                    topLeft: Radius.circular(16.0),
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
            ),
            Container(
              padding: const EdgeInsets.only(
                bottom: 16,
                left: 5,
                right: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                border: Border.all(color: Colors.grey),
              ),
              width: 249,
              height: 66,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$place',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        '$country',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    '$date',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
