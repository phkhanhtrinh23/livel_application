import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addCode(String id, String channel) async {
  await FirebaseFirestore.instance.collection('Trips').doc(id).update(
    {'Code': channel},
  );
}
