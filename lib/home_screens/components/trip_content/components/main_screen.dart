import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livel_application/model/database/queryFunction.dart';
import 'package:livel_application/model/joinButton.dart';
import 'package:livel_application/home_screens/components/trip_content/components/tourguide.dart';
import 'package:livel_application/model/database/storage.dart';

class MainContent extends StatelessWidget {
  const MainContent({Key key, this.id, this.checkHomeScreen}) : super(key: key);

  final String id;
  final bool checkHomeScreen;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: getTrip(id),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: getNetWorkImage(snapshot.data.get('Image')),
                  builder: (context, snapshotImage) {
                    if (snapshotImage.connectionState == ConnectionState.done) {
                      return Container(
                        width: _width,
                        height: 335,
                        padding: const EdgeInsets.only(
                          left: 18.0,
                          top: 32,
                          bottom: 8.0,
                          right: 18.0,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: snapshotImage.data,
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data.get('Country').toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 16,
                    right: 16,
                    bottom: 42.0,
                  ),
                  child: Text(
                    snapshot.data.get('Place'),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEE6C4D),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 23,
                    right: 23,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.timer,
                      ),
                      Text(
                        snapshot.data.get('Duration').toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        Icons.star_border_outlined,
                      ),
                      Text(
                        snapshot.data.get('Rating').toString() + '/5',
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        Icons.calendar_today_outlined,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat.jm()
                                .format((snapshot.data.get('Date')).toDate()),
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format((snapshot.data.get('Date')).toDate()),
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                    top: 42,
                    bottom: 23,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.map_outlined),
                      Padding(padding: const EdgeInsets.only(right: 8)),
                      Text(
                        'Information',
                        style: TextStyle(
                          fontSize: 28,
                          color: Color(0xFF4EAFC1),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Padding(padding: const EdgeInsets.only(right: 8)),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Divider(
                              color: Colors.grey,
                              thickness: 1,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    right: 23,
                    left: 23,
                  ),
                  child: Text(
                    snapshot.data.get('Description').toString(),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                TourGuide(id: snapshot.data.get("Guide's ID")),
                Container(
                  padding: const EdgeInsets.only(
                    right: 23,
                    left: 23,
                    bottom: 42,
                  ),
                  child: Text(
                    snapshot.data.get('Note'),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                    bottom: 150,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Trip Fee',
                        style: TextStyle(
                          color: Color(0xFF4EAFC1),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 106,
                        height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Color(0xFF4EAFC1),
                          ),
                        ),
                        child: Text(
                          '\$' + snapshot.data.get('Cost').toString(),
                          style: TextStyle(
                            color: Color(0xFFEAB25E),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                JoinRegister(
                  id: snapshot.data.id,
                  code: snapshot.data.get('Code'),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
