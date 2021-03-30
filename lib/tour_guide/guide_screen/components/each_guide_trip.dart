import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livel_application/database/queryFunction.dart';
import 'package:livel_application/video_call/broadcaster.dart';

class GuideTripScreen extends StatelessWidget {
  const GuideTripScreen({Key key, this.id});
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
              bottom: 16,
            ),
            width: 355,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: FlatButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                if (snapshot.data.get('Code').toString().isEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TourguidePage(snapshot.data.id, "")),
                  );
                } else
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TourguidePage(snapshot.data.id,
                              snapshot.data.get('Code').toString())));
              },
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 32),
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
                              fontSize: 18,
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
                              fontSize: 18,
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
          );
        }
        return Container();
      },
    );
  }
}
