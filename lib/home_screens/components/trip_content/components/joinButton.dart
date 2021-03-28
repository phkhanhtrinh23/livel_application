import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/database/queryFunction.dart';
import 'package:livel_application/home_screens/HomeScreen.dart';
import 'package:livel_application/home_screens/components/trip_content/components/payment.dart';
import 'package:livel_application/video_call/audience.dart';

import '../trip_main.dart';

class JoinRegister extends StatefulWidget{
  final String id, code;
  const JoinRegister({Key key, this.id, this.code}) : super(key: key);

  @override
  JoinRegisterState createState() => new JoinRegisterState(this.id, this.code);
}

class JoinRegisterState extends State<JoinRegister> {
  final String id, code;

  JoinRegisterState(this.id, this.code);

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return FutureBuilder(
        future: getJoin(uid),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<dynamic> arr = snapshot.data.get('TripList');
            if (arr.isNotEmpty) {
              if (arr.contains(id)){
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
                          'HOME SCREEN',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                      Spacer(),
                      FlatButton(
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
                          if(code.isNotEmpty){
                            print(code);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TouristPage(code)),
                            );
                          }
                          else print( Text("You can only join 15 minutes before the trip start."));
                        },
                      ),
                    ],
                  ),
                );
              }

            }
            return Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: FlatButton(
                    minWidth: 213,
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
                              Stripe(id,uid),
                        ),
                      );
                      // FirebaseFirestore.instance
                      //     .collection('Users')
                      //     .doc(uid)
                      //     .update({
                      //   "TripList": FieldValue.arrayUnion([id])
                      // });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         TripContent(id: this.id),
                      //   ),
                      // );
                    }));
          }
          return CircularProgressIndicator();
        });
  }
}
