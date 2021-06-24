import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:livel_application/model/database/queryFunction.dart';
import 'package:livel_application/view/home_screens/components/trip_content/trip_main.dart';
import 'package:livel_application/model/database/storage.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen(
      {Key key,
      this.image,
      this.cost,
      this.date,
      this.place,
      this.country,
      this.id,
      this.list});

  final String image, place, country, id, list;
  final Timestamp date;
  final int cost;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getNetWorkImage(image),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TripContent(
                    id: this.id,
                    checkHomeScreen: false,
                    list: list,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(6.0),
              margin: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 12,
              ),
              width: 343,
              height: 280,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF289CB4),
                ),
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFF5FDFF),
              ),
              child: Column(
                children: [
                  Container(
                    width: 329,
                    height: 186,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: snapshot.data,
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  FutureBuilder(
                    future: getTrip(id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          margin: const EdgeInsets.only(
                            top: 8.0,
                            left: 8.0,
                          ),
                          width: 320,
                          height: 70,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data.get('Place'),
                                    style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data.get('City'),
                                    style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data.get('Country'),
                                    style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    DateFormat.yMMMd().format(date.toDate()),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    'Rating: ' +
                                        snapshot.data.get('Rating').toString() +
                                        '/5',
                                    style: GoogleFonts.rubik(
                                      color: Colors.yellow[600],
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
