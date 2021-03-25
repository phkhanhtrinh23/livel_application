import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/trip_screen/components/each_place.dart';

Future<QuerySnapshot> getAvailable() async {
  return await FirebaseFirestore.instance.collection('Trips').get();
}
class allTrip extends StatelessWidget{
  const allTrip({
    Key key,
  }): super(key:key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAvailable(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return FutureBuilder(
            future: getAvailable(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.connectionState == ConnectionState.done){

                return ListView.builder(
                  itemCount: snapshot.data.size,
                  itemBuilder: (BuildContext context, int index){
                    return PlaceScreen(
                      image:snapshot.data.docs[index].get('Image'),
                      cost: snapshot.data.docs[index].get('Cost'),
                      time: snapshot.data.docs[index].get('Time').toString(),
                      date: 'March 16, 2021',
                      place: snapshot.data.docs[index].get('Name'),
                      id:snapshot.data.docs[index].id
                    );
                  },
                );
              }
              return CircularProgressIndicator();
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

}