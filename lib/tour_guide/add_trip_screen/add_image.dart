import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../guide_main_screen.dart';

class AddImage extends StatefulWidget {
  AddImage({
    Key key,
    this.place,
    this.city,
    this.cost,
    this.country,
    this.description,
    this.duration,
    this.note,
    this.time,
    this.form,
  }) : super(key: key);

  final TextEditingController place,
      city,
      country,
      duration,
      description,
      note,
      time,
      cost;
  final GlobalKey<FormState> form;

  @override
  _AddImage createState() => _AddImage();
}

class _AddImage extends State<AddImage> {
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<TimeOfDay> _selectTime(BuildContext context) {
    final now = DateTime.now();

    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );
  }

  Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: _height / 2.5,
              ),
              child: Container(
                width: 160,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                child: FlatButton(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    'Departure time',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () async {
                    final selectedDate = await _selectDateTime(context);
                    if (selectedDate == null) return;

                    final selectedTime = await _selectTime(context);
                    if (selectedTime == null) return;

                    setState(() {
                      this.selectedDate = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                    });
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 32),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: getImage,
                    child: Icon(
                      Icons.photo,
                      size: 50,
                    ),
                  ),
                  _image == null
                      ? Text('No image selected.')
                      : Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Image.file(_image),
                          height: 300,
                          width: 200,
                        ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 80,
                bottom: 40,
              ),
              child: FlatButton(
                padding: const EdgeInsets.all(0),
                onPressed: () async {
                  if (widget.form.currentState.validate()) {
                    String uid = FirebaseAuth.instance.currentUser.uid;
                    await FirebaseFirestore.instance.collection('Trips').add({
                      'Place': widget.place.text.trim(),
                      'City': widget.city.text,
                      'Cost': int.parse(widget.cost.text),
                      'Country': widget.country.text.trim(),
                      'Duration': widget.duration.text,
                      'Description': widget.description.text,
                      'Note': widget.note.text,
                      'Time': 9,
                      'Code': "",
                      'Date': this.selectedDate,
                      "Guide's ID": uid,
                      "Rating": 4.8,
                      "Image": basename(_image.path),
                    });
                    await FirebaseStorage.instance
                        .ref()
                        .child(basename(_image.path))
                        .putFile(_image);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GuideMainScreen(),
                      ),
                    );
                  }
                  return "Please check again";
                },
                child: Column(
                  children: [
                    Container(
                      width: 343,
                      height: 56,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xFF4EAFC1),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
