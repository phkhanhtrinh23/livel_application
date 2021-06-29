import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

Future<DocumentSnapshot> getJoin(String id) async {
  return await FirebaseFirestore.instance.collection("Users").doc(id).get();
}

Future<DocumentSnapshot> getTrip(String id) async {
  return await FirebaseFirestore.instance.collection('Trips').doc(id).get();
}

Future<DocumentSnapshot> getTagList() async {
  return await FirebaseFirestore.instance
      .collection('Dictionary')
      .doc('TagSystem')
      .get();
}
