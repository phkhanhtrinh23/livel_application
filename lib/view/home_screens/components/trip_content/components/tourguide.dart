import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livel_application/model/database/queryFunction.dart';

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
                  right: 16,
                  left: 18,
                  top: 23,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Divider(
                            color: Color(0xFF289CB4),
                            thickness: 2.0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(
                  right: 16,
                  left: 18,
                  top: 23,
                ),
                child: Text(
                  'Tour Guide',
                  style: GoogleFonts.rubik(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  bottom: 23,
                  right: 16,
                  left: 16,
                  top: 23,
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
                            padding: const EdgeInsets.only(
                              bottom: 16,
                            ),
                          ),
                          Text(
                            snapdata.get('Name'),
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
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
                            Icon(Icons.mail_outline),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 8,
                              ),
                            ),
                            Text(
                              snapdata.get('Mail').toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.check),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 8,
                              ),
                            ),
                            Text(
                              snapdata.get('Exp').toString() +
                                  ' year(s) experience',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_today_outlined),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 8,
                              ),
                            ),
                            Text(
                              snapdata.get('Age').toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                  left: 18,
                  top: 23,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Divider(
                            color: Color(0xFF289CB4),
                            thickness: 2.0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(
                  right: 16,
                  left: 18,
                  top: 23,
                ),
                child: Text(
                  'Agenda',
                  style: GoogleFonts.rubik(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
