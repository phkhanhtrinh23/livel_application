import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTrip extends StatelessWidget {
  AddTrip();
  final TextEditingController name = new TextEditingController();
  final TextEditingController place = new TextEditingController();
  final TextEditingController country = new TextEditingController();
  final TextEditingController duration = new TextEditingController();
  final TextEditingController description = new TextEditingController();
  final TextEditingController note = new TextEditingController();
  final TextEditingController time = new TextEditingController();
  final TextEditingController cost = new TextEditingController();
  final _form = GlobalKey<FormState>();

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
                  controller: name,
                  decoration: InputDecoration(
                    labelText: "Name",
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
                  controller: description,
                  decoration: InputDecoration(
                    labelText: "Description",
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
                  controller: note,
                  decoration: InputDecoration(
                    labelText: "Note",
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
                    labelText: "Cost (In \$)",
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
                top: 80,
                bottom: 40,
              ),
              child: FlatButton(
                padding: const EdgeInsets.all(0),
                onPressed: () async {
                  if (_form.currentState.validate()) {
                    String uid = FirebaseAuth.instance.currentUser.uid;
                    print(uid);
                    await FirebaseFirestore.instance.collection('Trips').add({
                      'Name': name.text.trim(),
                      'Place': place.text,
                      'Cost': int.parse(cost.text),
                      'Country': country.text.trim(),
                      'Duration': duration.text,
                      'Description': description.text,
                      'Note': note.text,
                      'Time': 9,
                      'Code': "",
                      'Date': "March 30 2021",
                      "Guide's ID": uid,
                      "Rating": 4.8,
                    });
                  }
                  return "Please check again";
                },
                child: Container(
                  width: 343,
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFFEE6C4D),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
