import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

Future<String> getURL(String image) async {
  return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
}

Future<NetworkImage> getNetWorkImage(String name) async {
  NetworkImage image;
  await getURL(name).then((value) => {
    image = NetworkImage(
      value.toString(),
      //fit: BoxFit.fitWidth
    )
  });
  return image;
}

Future<Widget> getImage(String name) async {
  Image image;
  await getURL(name).then((value) => {
    image = Image.network(
      value.toString(),
      //fit: BoxFit.fitWidth
    )
  });
  return image;
}
Future<void> addImage(File _image) async{
  return await FirebaseStorage.instance
      .ref()
      .child(basename(_image.path))
      .putFile(_image);
}

