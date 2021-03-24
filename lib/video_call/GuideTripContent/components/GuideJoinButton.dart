

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/video_call/tourguide.dart';
import 'package:livel_application/video_call/tourist.dart';

import '../GuideTripContent.dart';



Future<DocumentSnapshot> getCode(String id) async{
  return await FirebaseFirestore.instance.collection("Trips").doc(id).get();
}

class GuideJoinRegister extends StatelessWidget{
  final String id;
  const GuideJoinRegister({
    Key key,
    this.id
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    String uid=FirebaseAuth.instance.currentUser.uid;
    return FutureBuilder(
        future: getCode(id),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.connectionState==ConnectionState.done)
          {
            if(snapshot.data.get('Code').toString().isEmpty)
                return Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: FlatButton(
                    minWidth: 213,
                    height: 51,
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      'Create video call',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TourguidePage(snapshot.data.id,"")),
                      );
                    },
                  ),
                );
            else return TourguidePage(snapshot.data.id, snapshot.data.get('Code'));
          }
          return Container(
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              child: FlatButton(
                  minWidth: 213,
                  height: 51,
                  color: Colors.orange,
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
                    FirebaseFirestore.instance.collection('User').doc(uid).update({"TripList": FieldValue.arrayUnion([id])});
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => GuideTripContent(id:this.id),
                      ),
                    );
                  }
              )
          );

        }
    );
  }

}