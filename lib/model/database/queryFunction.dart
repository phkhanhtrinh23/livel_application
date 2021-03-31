import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

Future<QuerySnapshot> getTripInfo() async {
  return await FirebaseFirestore.instance.collection('Trips').get();
}

Future<QuerySnapshot> getTripRec() async {
  return await FirebaseFirestore.instance
      .collection('Trips')
      .orderBy('Rating', descending: true)
      .limit(10)
      .get();
}

Future<DocumentSnapshot> getName() async {
  return await FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .get();
}

Future<QuerySnapshot> getGuideTrip() async {
  return await FirebaseFirestore.instance
      .collection('Trips')
      .where("Guide's ID", isEqualTo: FirebaseAuth.instance.currentUser.uid)
      .get();
}

Future<QuerySnapshot> getCountry(String name) async {
  return await FirebaseFirestore.instance
      .collection('Trips')
      .where('Country', isEqualTo: name)
      .get();
}

Future<QuerySnapshot> getSearch(String search, String field) async {
  if (search == '')
    return await FirebaseFirestore.instance
        .collection('Trips')
        .where(field, isGreaterThanOrEqualTo: search)
        .get();
  return await FirebaseFirestore.instance
      .collection('Trips')
      .where(field, isEqualTo: search)
      .get();
}

Future<DocumentSnapshot> getJoin(String id) async {
  return await FirebaseFirestore.instance.collection("Users").doc(id).get();
}

Future<DocumentSnapshot> getTrip(String id) async {
  return await FirebaseFirestore.instance.collection('Trips').doc(id).get();
}
