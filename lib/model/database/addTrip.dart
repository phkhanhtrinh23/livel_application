import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:livel_application/model/database/storage.dart';

Future<void> addTrip(
  String place1,
  String city1,
  String country1,
  String description1,
  String gid,
  String thumbnail,
  int cost,
  String duration1,
  double rating,
  int time1,
  DateTime date,
  List<String> _image,
    List<String> tagList,
    List<String> time_agenda,
    List<String> place_agenda
) async {
  DocumentSnapshot dictionary = await FirebaseFirestore.instance
      .collection('Dictionary')
      .doc('trip-info')
      .get();
  if (!(dictionary.get('Total').contains(place1.trim().toLowerCase()))) {
    FirebaseFirestore.instance.collection('Dictionary').doc('trip-info').update(
      {
        "Total": FieldValue.arrayUnion([place1.trim().toLowerCase()])
      },
    );
  }
  if (!(dictionary.get('Total').contains(country1.trim().toLowerCase()))) {
    FirebaseFirestore.instance.collection('Dictionary').doc('trip-info').update(
      {
        "Total": FieldValue.arrayUnion([country1.trim().toLowerCase()])
      },
    );
  }
  if (!(dictionary.get('Total').contains(city1.trim().toLowerCase()))) {
    FirebaseFirestore.instance.collection('Dictionary').doc('trip-info').update(
      {
        "Total": FieldValue.arrayUnion([city1.trim().toLowerCase()])
      },
    );
  }

  return await FirebaseFirestore.instance.collection('Trips').add(
    {
      'Place': place1,
      'City': city1,
      'Cost': cost,
      'Country': country1,
      'Duration': duration1,
      'Description': description1,
      'Time': time1,
      'Code': "",
      'Date': date,
      "Guide's ID": gid,
      "Rating": rating,
      "Thumbnail": thumbnail,
      "Image": _image,
      "UserList": [],
      "TagList": tagList,
      "Time Agenda": time_agenda,
      "Place Agenda": place_agenda
    },
  );
}
