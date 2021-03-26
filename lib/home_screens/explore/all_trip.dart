import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/database/queryFunction.dart';
import 'package:livel_application/home_screens/components/trip_screen/components/each_place.dart';

class AllTrip extends StatelessWidget {
  const AllTrip({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTripInfo(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.size,
            itemBuilder: (BuildContext context, int index) {
              return PlaceScreen(
                  image: snapshot.data.docs[index].get('Image'),
                  cost: snapshot.data.docs[index].get('Cost'),
                  time: snapshot.data.docs[index].get('Time').toString(),
                  date: 'March 16, 2021',
                  place: snapshot.data.docs[index].get('Name'),
                  id: snapshot.data.docs[index].id);
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
