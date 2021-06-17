import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livel_application/model/database/addTrip.dart';
import 'package:livel_application/model/database/storage.dart';
import 'package:livel_application/view/tour_guide/guide_main_screen.dart';
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
  DateTime selectedDate = DateTime.now();
  List<File> _image = [];
  String _error = 'No Error Dectected';
  File thumnail;
  final picker = ImagePicker();
  firebase_storage.Reference ref;
  bool uploading = false;
  double val = 0;
  CollectionReference imgRef;
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        thumnail = File(pickedFile.path);
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

  @override
  void initState() {
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('imageURLs');
  }

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
                  color: Color(0xFF289CB4),
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
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
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
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color(0xFF289CB4),
                    ),
                  ),
                  child: TextButton(
                    child: Text(
                      'Departure time',
                      style: TextStyle(
                        color: Color(0xFF289CB4),
                      ),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 180,
                      height: 53,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xFF289CB4),
                        ),
                      ),
                      child: TextButton(
                        child: Text(
                          'Add Thumbnail',
                          style: TextStyle(
                            color: Color(0xFF289CB4),
                          ),
                        ),
                        onPressed: getImage,
                      ),
                    ),
                    thumnail == null
                        ? Text('No image selected.')
                        : Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Image.file(thumnail),
                            height: 300,
                            width: 200,
                          )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 32),
                  alignment: Alignment.center,
                  height: 600,
                  width: 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 180,
                        height: 53,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Color(0xFF289CB4),
                          ),
                        ),
                        child: TextButton(
                          child: Text(
                            'Add Image',
                            style: TextStyle(
                              color: Color(0xFF289CB4),
                            ),
                          ),
                          onPressed: chooseImage,
                        ),
                      ),
                      Container(
                        height: 300,
                        width: 500,
                        padding: EdgeInsets.all(4),
                        child: GridView.builder(
                            itemCount: _image.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(_image[index]),
                                        fit: BoxFit.cover)),
                              );
                            }),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 40,
                ),
                child: TextButton(
                    onPressed: () async {
                      if (_form.currentState.validate()) {
                        String uid = FirebaseAuth.instance.currentUser.uid;
                        addTrip(
                          place.text.trim(),
                          city.text,
                          country.text.trim(),
                          description.text,
                          note.text,
                          uid,
                          basename(thumnail.path),
                          int.parse(cost.text),
                          duration.text,
                          4.8,
                          this.selectedDate.hour,
                          this.selectedDate,
                          process(),
                        );
                        addImage(thumnail);
                        for (var i in _image) {
                          addImage(i);
                        }
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
                            color: Color(0xFF289CB4),
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

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile?.path));
    });
    if (pickedFile.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file.path));
      });
    } else {
      print(response.file);
    }
  }

  process() {
    List<String> list = [];
    for (var i in _image) {
      list.add(basename(i.path));
    }
    return list;
  }

  Future uploadFile() async {
    int i = 1;

    for (var img in _image) {
      setState(() {
        val = i / _image.length;
      });
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child(basename(img.path));
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.add({'url': value});
          i++;
        });
      });
    }
  }
}
