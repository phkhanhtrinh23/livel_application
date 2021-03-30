import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addTrip() async {
  return FirebaseFirestore.instance.collection('Trips').add({
    'Code': "",
    "Cost": 10,
    'Country': 'Vietnam',
    'Description':
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    'Duration': "20 min",
    'Place': 'Empire State',
    'City': 'New York',
    'Rating': 4.6,
    "guide's name": 'Trinh Pham',
    "Date": "March 20 2021",
    "Time": "8:00 AM",
    "Note": "Lorem ipsum",
    "Guide's ID": "123456",
    "Image": "images/1.png"
  });
}
