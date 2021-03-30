import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/database/queryFunction.dart';
import 'package:livel_application/home_screens/components/trip_screen/components/each_place.dart';

class AllTrip extends StatelessWidget {
  final String searchString, field;
  const AllTrip({Key key, this.searchString, this.field}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSearch(searchString, field),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData)
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.size,
              itemBuilder: (BuildContext context, int index) {
                return PlaceScreen(
                  image: snapshot.data.docs[index].get('Image'),
                  cost: snapshot.data.docs[index].get('Cost'),
                  time: snapshot.data.docs[index].get('Time').toString(),
                  date: snapshot.data.docs[index].get('Date'),
                  place: snapshot.data.docs[index].get('Place'),
                  id: snapshot.data.docs[index].id,
                );
              },
            );
          return Text("There is no trips for your search");
        }
        return Container(); //CircularProgressIndicator();
      },
    );
  }
}
