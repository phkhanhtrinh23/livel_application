import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/model/database/queryFunction.dart';

import 'recommended_trips.dart';

class RecommendedScreen extends StatelessWidget {
  RecommendedScreen({
    Key key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTripRec(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.size,
              itemBuilder: (BuildContext context, int index) {
                return RecommendedElement(
                  id: snapshot.data.docs[index].id,
                );
              });
        }
        return Container();
      },
    );
  }
}
