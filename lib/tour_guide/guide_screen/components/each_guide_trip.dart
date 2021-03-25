import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/database/queryFunction.dart';

import '../guide_trip_content_main.dart';

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
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 16,
            ),
            width: 355,
            height: 135,
            decoration: BoxDecoration(
              color: Color(0xFFDBEEFD),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GuideTripContent(id: this.id),
                  ),
                );
              },
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 32, left: 8),
                    child: Image.asset(
                      snapshot.data.get('Image'),
                      width: 111,
                      height: 119,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.data.get('Name'),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.blueAccent,
                            size: 15,
                          ),
                          Text(
                            snapshot.data.get('Date'),
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.blueAccent,
                            size: 15,
                          ),
                          Text(
                            snapshot.data.get('Place').toString(),
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "\$" + snapshot.data.get('Cost').toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
