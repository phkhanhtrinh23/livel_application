import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livel_application/view/home_screens/user_screen/components/profile.dart';
import 'package:livel_application/view/tour_guide/guide_screen/guide_trips.dart';

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
              margin: const EdgeInsets.only(bottom: 180),
              padding: const EdgeInsets.only(top: 24, bottom: 16),
              width: _width,
              height: 148,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: Color(0xFF289CB4),
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
                    style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ProfileMenu(
              text: "Your Trips",
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
              text: "Add A Trip",
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
