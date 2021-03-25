import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/database/queryFunction.dart';

class TourGuide extends StatelessWidget {
  final String id;
  const TourGuide({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getJoin(this.id),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          DocumentSnapshot snapdata = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 23,
                    left: 23,
                    top: 42,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.map_outlined),
                      Text(
                        'Tour Guide',
                        style: TextStyle(
                          fontSize: 26,
                          color: Color(0xFFEE6C4D),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 23,
                    right: 43,
                    left: 43,
                    top: 34,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'images/unknown.jpg',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Text(
                            snapdata.get('Name'),
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.phone),
                              Text(snapdata.get('Phone').toString()),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.check),
                              Text(snapdata.get('Exp').toString()),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.calendar_today_sharp),
                              Text(snapdata.get('Age').toString()),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    right: 23,
                    left: 23,
                    top: 42,
                    bottom: 23,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.map_outlined),
                      Text(
                        'Note',
                        style: TextStyle(
                          fontSize: 26,
                          color: Color(0xFFEE6C4D),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        });
  }
}
