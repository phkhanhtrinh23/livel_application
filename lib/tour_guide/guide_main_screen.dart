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
          children: [
            Container(
              padding: const EdgeInsets.only(top: 24, bottom: 16),
              width: _width,
              height: 148,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: Color(0xFF4EAFC1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    'Tour Guide',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
            ProfileMenu(
              text: "Guidelines",
              icon: Icon(
                Icons.bookmark_border_outlined,
                color: Color(0xFF477983),
              ),
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
              text: "Add a trip",
              icon: Icon(
                Icons.add_circle_outline,
                color: Color(0xFF477983),
              ),
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
