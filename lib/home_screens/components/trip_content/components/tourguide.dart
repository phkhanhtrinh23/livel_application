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
                      Padding(padding: const EdgeInsets.only(right: 8)),
                      Text(
                        'Tour Guide',
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
                              thickness: 2,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    bottom: 23,
                    right: 24,
                    left: 24,
                    top: 34,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 32),
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'images/unknown.jpg',
                                width: 100,
                                height: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                            ),
                            Text(
                              snapdata.get('Name'),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.mail_outline,
                                size: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                              ),
                              Text(
                                snapdata.get('Mail').toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check,
                                size: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                              ),
                              Text(
                                snapdata.get('Exp').toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                              ),
                              Text(
                                snapdata.get('Age').toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                      Padding(padding: const EdgeInsets.only(right: 8)),
                      Text(
                        'Note',
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
                              thickness: 2,
                            )
                          ],
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
