import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livel_application/view/home_screens/components/home_components/countries_elements.dart';
import 'package:livel_application/model/events.dart';
import 'package:livel_application/view/home_screens/components/home_components/upcoming.dart';
import 'package:livel_application/model/database/queryFunction.dart';

class MainHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    var day = date.day, month = date.month, year = date.year;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: 32,
                  ),
                  width: _width,
                  height: 220,
                  decoration: BoxDecoration(
                    color: Color(0xFF289CB4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FutureBuilder(
                        future: getName(),
                        builder: (context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Container(
                              margin: const EdgeInsets.only(
                                top: 32,
                                bottom: 8,
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Hello ' +
                                    snapshot.data.get('Name') +
                                    ',\nchoose your trip today!',
                                style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Container(
                    width: _width,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  top: 200,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 14,
                top: 24,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                'Upcoming Events',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF323232),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Events(
              images: [
                'images/picture_1.png',
                'images/picture_2.png',
                'images/picture_3.png',
              ],
            ), //!!Animated Widget
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Explore Countries',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF323232),
                      fontWeight: FontWeight.bold,
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
                    image: 'images/uk.png',
                    name: 'Vietnam',
                  ),
                  TripElement(
                    image: 'images/usa.png',
                    name: 'Canada',
                  ),
                  TripElement(
                    image: 'images/swhere.png',
                    name: 'Japan',
                  ),
                  TripElement(
                    image: 'images/uk.png',
                    name: 'England',
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Recommended Trips',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF323232),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(height: 250, width: _width, child: RecommendedScreen())
          ],
        ),
      ),
    );
  }
}
