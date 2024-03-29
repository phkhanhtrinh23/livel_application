import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:livel_application/model/database/queryFunction.dart';

Future<void> addDict() async {
  QuerySnapshot trips =
      await FirebaseFirestore.instance.collection('Trips').get();
  DocumentSnapshot dictionary = await FirebaseFirestore.instance
      .collection('Dictionary')
      .doc('trip-info')
      .get();
  for (var doc in trips.docs) {
    if (!(dictionary
        .get('PlaceList')
        .contains(doc.get('Place').toString().toLowerCase().trim()))) {
      FirebaseFirestore.instance
          .collection('Dictionary')
          .doc('trip-info')
          .update(
        {
          "PlaceList": FieldValue.arrayUnion(
              [doc.get('Place').toString().toLowerCase().trim()])
        },
      );
    }
    if (!(dictionary
        .get('CountryList')
        .contains(doc.get('Country').toString().toLowerCase().trim()))) {
      FirebaseFirestore.instance
          .collection('Dictionary')
          .doc('trip-info')
          .update(
        {
          "CountryList": FieldValue.arrayUnion(
              [doc.get('Country').toString().toLowerCase().trim()])
        },
      );
    }
    if (!(dictionary
        .get('CityList')
        .contains(doc.get('City').toString().toLowerCase().trim()))) {
      FirebaseFirestore.instance
          .collection('Dictionary')
          .doc('trip-info')
          .update(
        {
          "CityList": FieldValue.arrayUnion(
              [doc.get('City').toString().toLowerCase().trim()])
        },
      );
    }
  }
}

Future<void> addUserList() async {
  QuerySnapshot trips =
      await FirebaseFirestore.instance.collection('Trips').get();
  for (var doc in trips.docs) {
    FirebaseFirestore.instance.collection('Trips').doc(doc.id).update({
      "Id_call": int.parse(
          doc.get("Thumbnail").toString().replaceAll(new RegExp(r'[^0-9]'), ''))
    });
  }
}

Future<void> addThumnailAndImageList() async {
  QuerySnapshot trips =
      await FirebaseFirestore.instance.collection('Trips').get();
  for (var doc in trips.docs) {
    FirebaseFirestore.instance
        .collection('Trips')
        .doc(doc.id)
        .update({"Image": []});
  }
}
