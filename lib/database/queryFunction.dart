import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

Future<QuerySnapshot> getTripInfo() async {
  return await FirebaseFirestore.instance.collection('Trips').get();
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
Future<String> getURL(String image) async{
  return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
}
Future<NetworkImage> getNetWorkImage(String name) async{
  NetworkImage image;
  await getURL(name).then((value) => {
    image = NetworkImage(
      value.toString(),
      //fit: BoxFit.fitWidth
    )
  });
  return image;
}
Future<Widget> getImage(String name) async{
  Image image;
  await getURL(name).then((value) => {
    image = Image.network(
      value.toString(),
      //fit: BoxFit.fitWidth
    )
  });
  return image;
}
