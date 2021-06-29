import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livel_application/model/database/queryFunction.dart';
import 'package:livel_application/view/home_screens/your_trip/components/main_screen.dart';

class YourTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    String uid = FirebaseAuth.instance.currentUser.uid;
    return Scaffold(
        body: FutureBuilder(
      future: getJoin(uid),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData) {
          List<dynamic> arr = snapshot.data.get('TripList');
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: _width,
                  height: 148,
                  padding: const EdgeInsets.only(top: 24, bottom: 16),
                  margin: const EdgeInsets.only(bottom: 32),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    color: Color(0xFF289CB4),
                  ),
                  child: Text(
                    'Your Trips',
                    style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Ongoing Trips',
                    style: TextStyle(
                      color: Color(0xFF4EAFC1),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Container(
                  height: _height - 265,
                  child: ListView.builder(
                    itemCount: arr.length,
                    itemBuilder: (BuildContext context, int index) {
                      return YourTripScreen(
                        id: arr[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    ));
  }
}
