import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/database/queryFunction.dart';
import 'package:livel_application/home_screens/HomeScreen.dart';
import 'package:livel_application/home_screens/components/trip_content/components/payment.dart';
import 'package:livel_application/video_call/audience.dart';

class JoinRegister extends StatefulWidget {
  final String id, code;
  final bool checkHomeScreen;
  const JoinRegister({Key key, this.id, this.code, this.checkHomeScreen})
      : super(key: key);

  @override
  JoinRegisterState createState() =>
      new JoinRegisterState(this.id, this.code, this.checkHomeScreen);
}

class JoinRegisterState extends State<JoinRegister> {
  final String id, code;
  final bool checkHomeScreen;

  JoinRegisterState(this.id, this.code, this.checkHomeScreen);

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return FutureBuilder(
      future: getJoin(uid),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<dynamic> arr = snapshot.data.get('TripList');
          if (arr.isNotEmpty) {
            return Container(
              margin: const EdgeInsets.only(
                bottom: 20,
                left: 16,
                right: 16,
              ),
              child: Row(
                children: [
                  FlatButton(
                    minWidth: 180,
                    height: 51,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.black),
                    ),
                    child: Text(
                      'GO BACK',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      checkHomeScreen
                          ? Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            )
                          : Navigator.of(context).pop();
                    },
                  ),
                  Spacer(),
                  arr.contains(id)
                      ? FlatButton(
                          minWidth: 180,
                          height: 51,
                          color: Color(0xFFEE6C4D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            'JOIN',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            if (code.isNotEmpty) {
                              print(code);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TouristPage(code)),
                              );
                            } else
                              print(Text(
                                  "You can only join 15 minutes before the trip start."));
                          },
                        )
                      : FlatButton(
                          minWidth: 180,
                          height: 51,
                          color: Color(0xFFEE6C4D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Stripe(id, uid),
                              ),
                            );
                          },
                        ),
                ],
              ),
            );
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}
