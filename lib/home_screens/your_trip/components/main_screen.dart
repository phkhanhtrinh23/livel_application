import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/database/queryFunction.dart';
import 'package:livel_application/home_screens/components/trip_content/trip_main.dart';

class YourTripScreen extends StatelessWidget {
  const YourTripScreen({Key key, this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTrip(this.id),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print(id);
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
              color: Color(0xFFDBEEFD),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: FlatButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TripContent(id: this.id),
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
                      Flexible(
                        child: Text(
                          snapshot.data.get('Name'),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: false,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: Color(0xFF5197E1),
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
                            color: Color(0xFF5197E1),
                            size: 15,
                          ),
                          Text(
                            snapshot.data.get('Place').toString(),
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "\$" + snapshot.data.get('Cost').toString(),
                        style: TextStyle(
                          fontSize: 15,
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
