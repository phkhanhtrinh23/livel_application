import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livel_application/view/home_screens/components/trip_content/trip_main.dart';
import 'package:livel_application/model/database/storage.dart';
import 'package:livel_application/model/database/queryFunction.dart';

class RecommendedElement extends StatelessWidget {
  const RecommendedElement({
    Key key,
    this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTrip(id),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            margin: const EdgeInsets.only(
              left: 8.0,
            ),
            padding: const EdgeInsets.only(
              right: 16.0,
              left: 8.0,
              bottom: 16.0,
            ),
            child: TextButton(
              //padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => TripContent(
                      id: id,
                      checkHomeScreen: false,
                    ),
                  ),
                );
              },
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                    future: getNetWorkImage(snapshot.data.get('Image')),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          alignment: Alignment.topLeft,
                          width: 249,
                          height: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: snapshot.data,
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: 16,
                      left: 5,
                      right: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                      ),
                    ),
                    width: 249,
                    height: 62,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data.get('Place').toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              snapshot.data.get('Country').toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data.get('UserList').length.toString() + " people registered",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd()
                                  .format((snapshot.data.get('Date')).toDate()),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
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
