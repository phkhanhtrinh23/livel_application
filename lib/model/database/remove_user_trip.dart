import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> removeUserTrip(String id, String uid) async {
  FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .update(
    {
      "TripList": FieldValue.arrayRemove([id])
    },
  );
}