

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/video_call/tourist.dart';

import '../trip_main.dart';


Future<DocumentSnapshot> getJoin(String id) async{
  return await FirebaseFirestore.instance.collection("User").doc(id).get();
}

class JoinRegister extends StatelessWidget{
  final String id;
  const JoinRegister({
    Key key,
    this.id
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    String uid=FirebaseAuth.instance.currentUser.uid;
    return FutureBuilder(
        future: getJoin(uid),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
          DocumentSnapshot snapdata=snapshot.data;
          List<dynamic> arr=snapdata.get('TripList');
          if(snapshot.connectionState==ConnectionState.done)
          {
            if(arr.contains(id))
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
                    'JOIN',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TouristPage()),
                    );
                  },
                ),
              );
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
                        builder: (BuildContext context) => TripContent(id:this.id),
                      ),
                    );
                  }
              ));

        }
    );
  }

}