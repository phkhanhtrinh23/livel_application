import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:livel_application/model/database/queryFunction.dart';
import 'package:livel_application/model/livestreaming/host.dart';
import 'package:livel_application/model/payment.dart';
import 'package:livel_application/view/home_screens/HomeScreen.dart';
import 'package:permission_handler/permission_handler.dart';

class JoinRegister extends StatefulWidget {
  final String id, code, cost;
  final bool checkHomeScreen;
  final int gid;

  const JoinRegister(
      {Key key, this.id, this.code, this.cost, this.checkHomeScreen, this.gid})
      : super(key: key);

  @override
  JoinRegisterState createState() =>
      new JoinRegisterState(this.id, this.code, this.cost, this.gid);
}

class JoinRegisterState extends State<JoinRegister> {
  final String id, code, cost;
  final int gid;

  JoinRegisterState(this.id, this.code, this.cost, this.gid);

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

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
                    Container(
                      width: 150,
                      height: 51,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Color(0xFFE5E5E5),
                      ),
                      child: TextButton(
                        child: Text(
                          'GO BACK',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          widget.checkHomeScreen
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                )
                              : Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(right: 16)),
                    Container(
                      width: 150,
                      height: 51,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Color(0xFF289CB4),
                      ),
                      child: TextButton(
                        child: Text(
                          'JOIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          if (code.isNotEmpty) {
                            await _handleCameraAndMic(Permission.camera);
                            await _handleCameraAndMic(Permission.microphone);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BroadcastPage(
                                        userName: snapshot.data
                                            .get('Name')
                                            .toString(),
                                        channelName: code,
                                        isBroadcaster: false,
                                        id: id,
                                        gid: gid,
                                      )),
                            );
                          } else {
                            return showDialog<void>(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text(
                                    'You can only join the video call 10 minutes early.',
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        'Confirm',
                                        style: TextStyle(
                                          color: Color(0xFF289CB4),
                                        ),
                                      ),
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
                Container(
                  width: 150,
                  height: 51,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Color(0xFFE5E5E5),
                  ),
                  child: TextButton(
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
                ),
                Padding(padding: const EdgeInsets.only(right: 16)),
                Container(
                  width: 150,
                  height: 51,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Color(0xFF289CB4),
                  ),
                  child: TextButton(
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Stripe(id, uid, cost),
                        ),
                      );
                    },
                  ),
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
