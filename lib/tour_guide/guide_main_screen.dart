import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/user_screen/user_main.dart';
import 'package:livel_application/tour_guide/guide_screen/guide_trips.dart';

import 'add_trip_screen/add_trip.dart';

class GuideMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: _width,
              height: 148,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(top: 24, bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: Color(0xFF5197E1),
              ),
              child: Text(
                "It's guide time",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            ProfileMenu(
              text: "Guidelines",
              icon: Icon(Icons.bookmark_border_outlined),
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => GuideScreen(),
                  ),
                ),
              },
            ),
            ProfileMenu(
              text: "Add Trip",
              icon: Icon(Icons.logout),
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => AddTrip(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}