import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/your_trip/components/main_screen.dart';

import 'GuideTripScreen.dart';

Future< QuerySnapshot > getGuideTrip() async{
  return await FirebaseFirestore.instance.collection('Trips').where("Guide's ID", isEqualTo: FirebaseAuth.instance.currentUser.uid).get();
}

class GuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    String uid=FirebaseAuth.instance.currentUser.uid;
    return Scaffold(
        body: FutureBuilder(
          future: getGuideTrip(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){

            if(snapshot.hasData){
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: _width,
                      height: 148,
                      padding: const EdgeInsets.only(top: 24, bottom: 16),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        color: Color(0xFF5197E1),
                      ),
                      child: Text(
                        'Guide Trips',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                    ),
                    Container(
                      height: 580,
                      child: ListView.builder(
                          itemCount: snapshot.data.size,
                          itemBuilder: (BuildContext context, int index){
                            return GuideTripScreen(
                              id: snapshot.data.docs[index].id,
                            );
                          }
                      ),
                    )
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        )
    );
  }
}
