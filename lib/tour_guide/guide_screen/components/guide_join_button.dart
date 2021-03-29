import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/database/queryFunction.dart';
import 'package:livel_application/video_call/broadcaster.dart';
import '../guide_trip_content_main.dart';

class GuideJoinRegister extends StatelessWidget {
  final String id;
  const GuideJoinRegister({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return FutureBuilder(
        future: getTrip(id),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.get('Code').toString().isEmpty)
              return Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: FlatButton(
                  minWidth: 213,
                  height: 51,
                  color: Color(0xFF4EAFC1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    'Create video call',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TourguidePage(snapshot.data.id, "")),
                    );
                  },
                ),
              );
            //return TourguidePage(snapshot.data.id, snapshot.data.get('Code'));
          }
          return Container(
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              child: FlatButton(
                  minWidth: 213,
                  height: 51,
                  color: Color(0xFF4EAFC1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    'Travel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TourguidePage(snapshot.data.id,
                              snapshot.data.get('Code').toString())),
                    );
                  }));
        });
  }
}
