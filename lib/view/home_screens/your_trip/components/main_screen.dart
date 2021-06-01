import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livel_application/view/home_screens/components/trip_content/trip_main.dart';
import 'package:livel_application/model/database/queryFunction.dart';

class YourTripScreen extends StatefulWidget {
  const YourTripScreen({Key key, this.id});
  final String id;

  @override
  _YourTripScreen createState() => _YourTripScreen(id: id);
}

class _YourTripScreen extends State<YourTripScreen> {
  _YourTripScreen({this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTrip(this.id),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 16,
            ),
            width: 355,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TripContent(
                        id: this.id,
                        checkHomeScreen: false,
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: Image.asset(
                        'images/trip_image.png',
                        width: 150,
                        height: 120,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat.jm()
                              .format((snapshot.data.get('Date')).toDate()),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4EAFC1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              color: Color(0xFF4EAFC1),
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                            ),
                            Text(
                              DateFormat.yMMMd()
                                  .format((snapshot.data.get('Date')).toDate()),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Color(0xFF4EAFC1),
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                            ),
                            Text(
                              snapshot.data.get('Place').toString(),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                        ),
                        Text(
                          "\$" + snapshot.data.get('Cost').toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
