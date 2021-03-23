import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/trip_content/components/joinButton.dart';
import 'package:livel_application/home_screens/components/trip_content/components/tourguide.dart';

Future<DocumentSnapshot> getTrip(String id) async {
  return await FirebaseFirestore.instance.collection('Trips').doc(id).get();
}

class GuideMainContent extends StatelessWidget {
  const GuideMainContent({Key key, this.id}) : super(key: key);

  final String id;
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
                Container(
                  width: _width,
                  height: 335,
                  padding: const EdgeInsets.only(
                    left: 18.0,
                    top: 8.0,
                    bottom: 8.0,
                    right: 18.0,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(snapshot.data.get('Image')),
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
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_sharp,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            snapshot.data.get('Country').toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.center,
                            width: 52,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Color(0xFFEE6C4D),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              snapshot.data.get('Cost').toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    left: 18.0,
                    bottom: 42.0,
                  ),
                  child: Text(
                    snapshot.data.get('Name'),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5197E1),
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
                      Icon(Icons.timer),
                      Text(snapshot.data.get('Duration').toString()),
                      Spacer(),
                      Icon(Icons.face),
                      Text(snapshot.data.get('Rating').toString() + '/5'),
                      Spacer(),
                      Icon(Icons.calendar_today_sharp),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data.get('Time')),
                          Text('March 3 2021'),
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
                      Text(
                        'Information',
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
                  padding: const EdgeInsets.only(
                    right: 23,
                    left: 23,
                  ),
                  child: Text(
                    snapshot.data.get('Description').toString(),
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    right: 23,
                    left: 23,
                    bottom: 200,
                  ),
                  child: Text(
                    snapshot.data.get('Note').toString(),
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                JoinRegister(id: snapshot.data.id)
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}