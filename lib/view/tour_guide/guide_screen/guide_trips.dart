import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livel_application/model/database/queryFunction.dart';

import 'components/each_guide_trip.dart';

class GuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    // String uid = FirebaseAuth.instance.currentUser.uid;
    return Scaffold(
        body: FutureBuilder(
      future: getGuideTrip(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
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
                        'Your Trips',
                        style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                ),
                Container(
                  height: _height - 148 - 50,
                  child: ListView.builder(
                      itemCount: snapshot.data.size,
                      itemBuilder: (BuildContext context, int index) {
                        return GuideTripScreen(
                          id: snapshot.data.docs[index].id,
                        );
                      }),
                )
              ],
            ),
          );
        }
        return Container();
      },
    ));
  }
}
