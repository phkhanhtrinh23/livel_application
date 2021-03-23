import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/database/addTrip.dart';
import 'package:livel_application/database/addUser.dart';

import '../HomeMain.dart';
import 'authentication_service.dart';

final _form = GlobalKey<FormState>();

class PersonalInfo extends StatelessWidget {
  PersonalInfo(this.email, this.password);
  final String email, password;

  final TextEditingController name = new TextEditingController();
  final TextEditingController age = new TextEditingController();
  final TextEditingController country = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Please provide your info"),
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
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
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
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_form.currentState.validate()) {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email.trim(),
                        password: password.trim(),
                      );
                      await FirebaseFirestore.instance
                          .collection('User')
                          .doc(FirebaseAuth.instance.currentUser.uid)
                          .set({
                        'Age': age.text.trim(),
                        'Country': country.text.trim(),
                        "Exp": 0,
                        'Name': name.text.trim(),
                        'Phone': phone.text.trim(),
                        'Rating': 0,
                        'TripList': []
                      });
                      await FirebaseAuth.instance.currentUser
                          .updateProfile(displayName: name.text.trim());
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeMain()),
                      );
                    }
                    return "Please check again";
                  },
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}