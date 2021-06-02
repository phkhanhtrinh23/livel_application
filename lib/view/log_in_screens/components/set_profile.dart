import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Please provide your info"),
        backgroundColor: Color(0xFF4EAFC1),
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
                          checkYes = !checkYes;
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
                          checkYes = !checkYes;
                          tourguide = 'No';
                        });
                      },
                      icon: checkYes == false
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
              Padding(padding: const EdgeInsets.only(bottom: 48.0)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: TextButton(
                  onPressed: () async {
                    if (_form.currentState.validate()) {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
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
                        },
                      );
                      await FirebaseAuth.instance.currentUser
                          .updateProfile(displayName: name.text.trim());
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
                      color: Color(0xFFEE6C4D),
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
