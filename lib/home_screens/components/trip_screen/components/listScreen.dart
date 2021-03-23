import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/trip_screen/components/each_place.dart';

Future<QuerySnapshot> getCountry(String name) async {
  return await FirebaseFirestore.instance.collection('Trips').where('Country', isEqualTo: name).get();
}

class ListScreen extends StatelessWidget{
  final String name;
  ListScreen({
    Key key,
    this.name
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCountry(name),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return ListView.builder(
            itemCount: snapshot.data.size,
            itemBuilder: (BuildContext context, int index){
              return PlaceScreen(
                image: snapshot.data.docs[index].get('Image'),
                country: snapshot.data.docs[index].get('Country'),
                cost: snapshot.data.docs[index].get('Cost'),
                time: snapshot.data.docs[index].get('Time'),
                date: 'March 3 2021',
                place: snapshot.data.docs[index].get('Place'),
                id: snapshot.data.docs[index].id,
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

}