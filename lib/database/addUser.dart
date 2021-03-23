import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addUser(
    String name,
    String age,
    String country,
    String phone,
    ) async {
  // Call the user's CollectionReference to add a new user
  await FirebaseFirestore.instance.collection('User').doc(FirebaseAuth.instance.currentUser.uid).set({
    'Age': age,
    'Country':country,
    "Exp": 0,
    'Name':name,
    'Phone': phone,
    'Rating': 0,
    'TripList': []
  });
}