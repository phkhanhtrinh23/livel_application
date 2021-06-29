import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/model/database/queryFunction.dart';
import 'package:livel_application/view/home_screens/components/trip_screen/components/each_place.dart';

class ListScreen extends StatelessWidget {
  final String name;

  ListScreen({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCountry(name),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.size,
            itemBuilder: (BuildContext context, int index) {
              return PlaceScreen(
                image: snapshot.data.docs[index].get('Thumbnail'),
                country: snapshot.data.docs[index].get('Country'),
                cost: snapshot.data.docs[index].get('Cost'),
                date: snapshot.data.docs[index].get('Date'),
                place: snapshot.data.docs[index].get('Place'),
                list:
                    snapshot.data.docs[index].get('UserList').length.toString(),
                id: snapshot.data.docs[index].id,
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
