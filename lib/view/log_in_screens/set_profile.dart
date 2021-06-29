import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livel_application/model/database/storage.dart';
import 'package:path/path.dart';

import '../../../state_home.dart';

class PersonalInfo extends StatefulWidget {
  final String email, password;

  PersonalInfo(this.email, this.password);

  @override
  _PersonalInfo createState() => _PersonalInfo(email, password);
}

class _PersonalInfo extends State<PersonalInfo> {
  final String email, password;

  _PersonalInfo(this.email, this.password);

  final TextEditingController name = new TextEditingController();
  final TextEditingController age = new TextEditingController();
  final TextEditingController country = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  String tourguide;
  bool checkYes = false;
  bool checkNo = true;

  final _form = GlobalKey<FormState>();
  File avatar;
  final picker = ImagePicker();

  Widget selectAvatar() {
    return Container(
      alignment: Alignment.center,
      height: (avatar == null) ? 80 : 280,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 180,
            height: 53,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xFF289CB4),
            ),
            child: TextButton(
              child: Text(
                'Add Avatar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              onPressed: getImage,
            ),
          ),
          avatar == null
              ? Text(
                  'No image selected.',
                  style: GoogleFonts.rubik(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Image.file(avatar),
                  height: 200,
                  width: 200,
                )
        ],
      ),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        avatar = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Please provide your info"),
        backgroundColor: Color(0xFF289CB4),
      ),
      body: Form(
        key: _form,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 85,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
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
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                child: Container(
                  width: 343,
                  height: 53,
                  child: TextFormField(
                    autofocus: true,
                    controller: age,
                    decoration: InputDecoration(
                      labelText: "Age",
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
                  top: 16,
                  left: 16,
                  right: 16,
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
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                child: Container(
                  width: 343,
                  height: 53,
                  child: TextFormField(
                    autofocus: true,
                    controller: phone,
                    decoration: InputDecoration(
                      labelText: "Phone number",
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
              Container(
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.only(
                  top: 16,
                  left: 12,
                  right: 16,
                ),
                width: 343,
                height: 53,
                child: Text(
                  'Are you a tour guide?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 16,
                  left: 12,
                  right: 16,
                ),
                width: 343,
                height: 53,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {
                        setState(() {
                          checkYes = true;
                          checkNo = false;
                          tourguide = 'Yes';
                        });
                      },
                      icon: checkYes == true
                          ? Icon(Icons.radio_button_checked_sharp)
                          : Icon(Icons.radio_button_off_sharp),
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 48),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {
                        setState(() {
                          checkYes = false;
                          checkNo = true;
                          tourguide = 'No';
                        });
                      },
                      icon: checkNo == true
                          ? Icon(Icons.radio_button_checked_sharp)
                          : Icon(Icons.radio_button_off_sharp),
                    ),
                    Text(
                      'No',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              selectAvatar(),
              Padding(padding: const EdgeInsets.only(bottom: 48.0)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: TextButton(
                  onPressed: () async {
                    if (_form.currentState.validate()) {
                      addImage(avatar);
                      await FirebaseFirestore.instance
                          .collection('Users')
                          .doc(FirebaseAuth.instance.currentUser.uid)
                          .set(
                        {
                          'Age': age.text.trim(),
                          'Country': country.text.trim(),
                          "Exp": 0,
                          'Name': name.text.trim(),
                          'Phone': phone.text.trim(),
                          'Rating': 0,
                          'TripList': [],
                          'TourGuide': tourguide,
                          'Mail': email,
                          'Avatar': avatar == null
                              ? "unknown.jpg"
                              : basename(avatar.path),
                        },
                      );
                      await FirebaseAuth.instance.currentUser.updateProfile(
                        displayName: name.text.trim(),
                      );
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text(
                            'You have successfully registered an account in Livel.',
                          ),
                          actions: [
                            TextButton(
                              child: Text(
                                'Confirm',
                                style: TextStyle(
                                  color: Color(0xFF289CB4),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              onPressed: () => Navigator.of(context).pop(true),
                            ),
                          ],
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeMain()),
                      );
                    }
                    return "Please enter again.";
                  },
                  child: Container(
                    width: 343,
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xFF289CB4),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
