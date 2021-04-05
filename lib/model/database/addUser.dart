import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addUser(
  String name,
  String age,
  String country,
  String mail,
  String phone,
) async {
  // Call the user's CollectionReference to add a new user
  await FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .set(
    {
      'Age': age,
      'Country': country,
      "Exp": 0,
      'Name': name,
      'Phone': phone,
      'Mail': mail,
      'Rating': 0,
      'TripList': []
    },
  );
}
