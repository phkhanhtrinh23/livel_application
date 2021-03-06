import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/available_elements.dart';
import 'package:livel_application/home_screens/components/trip_elements.dart';

class MainHome extends StatelessWidget {
  MainHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return ListView(
      padding: const EdgeInsets.only(top: 96.0),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Hello Khoa Tran,\nwhich trip you want to go today?',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Content of traveling',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          color: Color(0xFF687EF4),
          width: _width,
          height: 300,
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Trips',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            FlatButton(
              minWidth: 10,
              height: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Color(0xFF687EF4),
              onPressed: () {},
              child: Text(
                "View all",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              TripElement(
                day: 4,
                view: "VIEW NOW",
              ),
              TripElement(
                day: 4,
                view: "VIEW NOW",
              ),
              TripElement(
                day: 4,
                view: "VIEW NOW",
              ),
              TripElement(
                day: 4,
                view: "VIEW NOW",
              ),
              TripElement(
                day: 4,
                view: "VIEW NOW",
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 24.0,
                bottom: 16.0,
              ),
              child: Text(
                'Available trips',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            FlatButton(
              minWidth: 10,
              height: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Color(0xFF687EF4),
              onPressed: () {},
              child: Text(
                "View all",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              AvailableElement(
                name: 'Khoa',
                day: 'Mar 05, 2021',
              ),
              AvailableElement(
                name: 'Khoa',
                day: 'Mar 05, 2021',
              ),
              AvailableElement(
                name: 'Khoa',
                day: 'Mar 05, 2021',
              ),
              AvailableElement(
                name: 'Khoa',
                day: 'Mar 05, 2021',
              ),
              AvailableElement(
                name: 'Khoa',
                day: 'Mar 05, 2021',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
