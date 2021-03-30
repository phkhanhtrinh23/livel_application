import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livel_application/tour_guide/guide_main_screen.dart';
import 'package:path/path.dart';

class AddTrip extends StatefulWidget {
  @override
  AddTripState createState() => new AddTripState();
}

class AddTripState extends State<AddTrip> {
  AddTripState();
  final TextEditingController place = new TextEditingController();
  final TextEditingController city = new TextEditingController();
  final TextEditingController country = new TextEditingController();
  final TextEditingController duration = new TextEditingController();
  final TextEditingController description = new TextEditingController();
  final TextEditingController note = new TextEditingController();
  final TextEditingController time = new TextEditingController();
  final TextEditingController cost = new TextEditingController();
  final _form = GlobalKey<FormState>();

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
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 80,
                ),
                padding: const EdgeInsets.only(top: 32, bottom: 16),
                width: _width,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  color: Color(0xFF4EAFC1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      'Add a trip',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 16.0,
                ),
                child: Container(
                  width: 343,
                  height: 53,
                  child: TextFormField(
                    autofocus: true,
                    controller: place,
                    decoration: InputDecoration(
                      labelText: "Place",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This field is empty";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 16.0,
                ),
                child: Container(
                  width: 343,
                  height: 53,
                  child: TextFormField(
                    autofocus: true,
                    controller: city,
                    decoration: InputDecoration(
                      labelText: "City",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This field is empty";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 16.0,
                ),
                child: Container(
                  width: 343,
                  height: 53,
                  child: TextFormField(
                    autofocus: true,
                    controller: country,
                    decoration: InputDecoration(
                      labelText: "Country",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This field is empty";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 16.0,
                ),
                child: Container(
                  width: 343,
                  height: 53,
                  child: TextFormField(
                    autofocus: true,
                    controller: duration,
                    decoration: InputDecoration(
                      labelText: "Duration (In minutes)",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This field is empty";
                      }
                      final isDigitsOnly = int.tryParse(value);
                      return isDigitsOnly == null
                          ? 'Input needs to be digits only'
                          : null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 16.0,
                ),
                child: Container(
                  width: 343,
                  height: 53,
                  child: TextFormField(
                    autofocus: true,
                    controller: cost,
                    decoration: InputDecoration(
                      labelText: "Cost (In\$)",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This field is empty";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 48,
                ),
                child: Container(
                  width: 180,
                  height: 53,
                  child: FlatButton(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Container(
                          width: 180,
                          height: 53,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Color(0xFFEE6C4D)),
                          ),
                          child: Text(
                            'Departure time',
                            style: TextStyle(color: Color(0xFFEE6C4D)),
                          ),
                        ),
                      ],
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
                            )
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(
                  top: 48,
                  bottom: 40,
                ),
                child: FlatButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () async {
                      if (_form.currentState.validate()) {
                        String uid = FirebaseAuth.instance.currentUser.uid;
                        await FirebaseFirestore.instance
                            .collection('Trips')
                            .add({
                          'Place': place.text.trim(),
                          'City': city.text,
                          'Cost': int.parse(cost.text),
                          'Country': country.text.trim(),
                          'Duration': duration.text,
                          'Description': description.text,
                          'Note': note.text,
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
                                builder: (context) => GuideMainScreen()));
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
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
