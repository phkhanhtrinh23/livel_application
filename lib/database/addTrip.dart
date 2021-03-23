import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/editable_text.dart';

Future<void> addTrip(TextEditingController name) async {
  // Call the user's CollectionReference to add a new user
  return FirebaseFirestore.instance.collection('Trips').add({
    'Country': 'Vietnam',
    'Description':
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    'Duration': "20 min",
    'Name': 'Empire State',
    'Place': 'New York',
    'Rating': 4.6,
    "guide's name": 'Trinh Pham',
    "Date": "March 20 2021",
    "Time": "8:00 AM",
    "Note": "Lorem ipsum",
    "Guide's ID": "123456",
    "Image": "images/1.png"
  });
}
