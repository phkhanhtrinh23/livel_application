import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'available_elements.dart';

Future<QuerySnapshot> getTripInfo() async{
  return await FirebaseFirestore.instance.collection('Trips').get();
}

class UpcomingScreen extends StatelessWidget {
  UpcomingScreen({
    Key key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTripInfo(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.size,
              itemBuilder: (BuildContext context, int index) {
                return AvailableElement(
                  id: snapshot.data.docs[index].id,
                );
              }
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}