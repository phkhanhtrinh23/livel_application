import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/trip_content/trip_main.dart';

class AvailableElement extends StatelessWidget {
  const AvailableElement({
    Key key,
    this.name,
    this.day,
    this.image,
  }) : super(key: key);

  final String name, day, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 16.0,
        left: 4.0,
        bottom: 16.0,
      ),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => TripContent(),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            Image.asset(
              image,
              width: 208,
              height: 184,
            ),
            Container(
              width: 208,
              height: 30,
              child: Text(
                '$name',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFDBE1FF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
            ),
            Container(
              width: 208,
              height: 30,
              child: Row(
                children: [
                  Text(
                    '$day',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Cost:',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
