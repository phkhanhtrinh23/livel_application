import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/view/home_screens/HomeScreen.dart';
import 'package:livel_application/model/payment.dart';
import 'package:livel_application/model/database/queryFunction.dart';
import 'package:livel_application/model/video_call/audience.dart';

class JoinRegister extends StatefulWidget {
  final String id, code, cost;
  const JoinRegister({Key key, this.id, this.code, this.cost}) : super(key: key);

  @override
  JoinRegisterState createState() => new JoinRegisterState(this.id, this.code, this.cost);
}

class JoinRegisterState extends State<JoinRegister> {
  final String id, code, cost;

  JoinRegisterState(this.id, this.code, this.cost);

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return FutureBuilder(
      future: getJoin(uid),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<dynamic> arr = snapshot.data.get('TripList');
          if (arr.isNotEmpty) {
            if (arr.contains(id)) {
              return Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      minWidth: 150,
                      height: 51,
                      color: Color(0xFFE5E5E5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        'GO BACK',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                    ),
                    Padding(padding: const EdgeInsets.only(right: 16)),
                    FlatButton(
                      minWidth: 150,
                      height: 51,
                      color: Color(0xFF4EAFC1),
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
                        } else {
                          return showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Announcement'),
                                content: SingleChildScrollView(
                                  child: Text(
                                      'You can only join the video call 10 minutes early'),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Confirm'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
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
              left: 8,
              right: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  minWidth: 150,
                  height: 51,
                  color: Color(0xFFE5E5E5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    'GO BACK',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Padding(padding: const EdgeInsets.only(right: 16)),
                FlatButton(
                  minWidth: 150,
                  height: 51,
                  color: Color(0xFF4EAFC1),
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
                        builder: (BuildContext context) => Stripe(id, uid, cost),
                      ),
                    );
                  },
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