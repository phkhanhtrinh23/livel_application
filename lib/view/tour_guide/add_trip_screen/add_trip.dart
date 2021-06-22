import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:livel_application/model/database/addTrip.dart';
import 'package:livel_application/model/database/storage.dart';
import 'package:livel_application/view/tour_guide/add_trip_screen/tag.dart';
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
  final TextEditingController time = new TextEditingController();
  final TextEditingController cost = new TextEditingController();
  final _form = GlobalKey<FormState>();

  final List<TextEditingController> agenda_time = [];
  final List<TextEditingController> agenda_place = [];

  File thumnail;
  List<File> _image = [];

  DateTime selectedDate = DateTime.now();

  final picker = ImagePicker();

  firebase_storage.Reference ref;
  bool uploading = false;

  double val = 0;

  CollectionReference imgRef;

  static List<String> queryTag = [];

  int dropdown = 0;

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
    for (int i = 0; i <= 3; i++) {
      agenda_place.add(new TextEditingController());
      agenda_time.add(new TextEditingController());
    }
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
              textFill("Name", place, false, 343),
              textFill("City", city, false, 343),
              textFill("Country", country, false, 343),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textFill("Duration (Mins)", duration, true, 160),
                  Container(
                    width: 20,
                  ),
                  textFill("Cost (\$)", cost, true, 160),
                ],
              ),
              textFill("Description", description, false, 343),
              Container(
                margin: const EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                width: 500,
                height: 65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: Color(0xFF289CB4))),
                      child: TextButton(
                        child: Text(
                          "Add A Tag",
                          style: GoogleFonts.rubik(
                            color: Color(0xFF289CB4),
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return Tag(); // !! This is where tag goes
                            },
                          );
                        },
                      ),
                    ),
                    queryTag.length == 0
                        ? Container()
                        : Text(
                            queryTag.toString(),
                            style: GoogleFonts.rubik(
                              color: Colors.black45,
                              fontSize: 16,
                            ),
                          ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 18,
                  top: 8,
                ),
                alignment: Alignment.center,
                width: 300,
                height: 55 + (dropdown * 70).ceilToDouble(),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Color(0xFF289CB4))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 10),
                        Text(
                          "Agenda: Number of places",
                          style: GoogleFonts.rubik(
                            color: Color(0xFF289CB4),
                            fontSize: 16,
                          ),
                        ),
                        Container(width: 10),
                        DropdownButton<int>(
                          value: dropdown,
                          icon:
                              const Icon(Icons.arrow_drop_down_circle_outlined),
                          iconSize: 20,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Color(0xFF289CB4),
                          ),
                          onChanged: (int newValue) {
                            setState(() {
                              dropdown = newValue;
                            });
                          },
                          items: <int>[0, 1, 2, 3, 4]
                              .map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    dropdown == 0
                        ? Container()
                        : Container(
                            height: 70 * dropdown.toDouble(),
                            child: ListView.builder(
                              itemCount: dropdown,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 80,
                                          height: 60,
                                          child: TextFormField(
                                            autofocus: true,
                                            controller: agenda_time[index],
                                            decoration: InputDecoration(
                                              labelText: "Time",
                                              labelStyle: GoogleFonts.rubik(
                                                color: Colors.black45,
                                                fontSize: 15,
                                              ),
                                              hintText: "hh:mm",
                                              hintStyle: GoogleFonts.rubik(
                                                color: Colors.black45,
                                                fontSize: 15,
                                              ),
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
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
                                        Container(width: 15),
                                        Container(
                                          width: 180,
                                          height: 60,
                                          child: TextFormField(
                                            autofocus: true,
                                            controller: agenda_place[index],
                                            decoration: InputDecoration(
                                              labelText: "Detailed agenda",
                                              labelStyle: GoogleFonts.rubik(
                                                color: Colors.black45,
                                                fontSize: 15,
                                              ),
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
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
                                        //),
                                      ],
                                    ),
                                    Container(
                                      height: 10,
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                  ],
                ),
              ),
              departureTime(context),
              selectThumbnail(),
              multiImages(),
              makeSubmit(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFill(
      String field, TextEditingController controller, bool isDigit, int width) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.0,
      ),
      child: Container(
        width: width.toDouble(),
        height: 53,
        child: TextFormField(
          autofocus: true,
          controller: controller,
          decoration: InputDecoration(
            labelText: field,
            labelStyle: GoogleFonts.rubik(
              color: Colors.black45,
              fontSize: 16,
            ),
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
            if (isDigit) {
              final isDigitsOnly = int.tryParse(value);
              return isDigitsOnly == null
                  ? 'Input needs to be digits only'
                  : null;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget departureTime(BuildContext context) {
    return Container(
        width: 180,
        height: 80,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: 53,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Color(0xFF289CB4),
                ),
              ),
              child: TextButton(
                child: Text(
                  'Departure time',
                  style: GoogleFonts.rubik(
                    color: Color(0xFF289CB4),
                    fontSize: 15,
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
            Text(
              DateFormat.yMMMd().add_jm().format((this.selectedDate)),
              style: GoogleFonts.rubik(
                color: Colors.black45,
                fontSize: 15,
              ),
            ),
          ],
        ));
  }

  Widget selectThumbnail() {
    return Container(
      alignment: Alignment.center,
      height: (thumnail == null) ? 80 : 280,
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
                style: GoogleFonts.rubik(
                  color: Color(0xFF289CB4),
                  fontSize: 15,
                ),
              ),
              onPressed: getImage,
            ),
          ),
          thumnail == null
              ? Text(
                  'No image selected.',
                  style: GoogleFonts.rubik(
                    color: Colors.black45,
                    fontSize: 15,
                  ),
                )
              : Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Image.file(thumnail),
                  height: 200,
                  width: 200,
                )
        ],
      ),
    );
  }

  Widget multiImages() {
    return Container(
        alignment: Alignment.center,
        height: _image.length == 0 ? 100 : 360,
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
                  'Add Images',
                  style: GoogleFonts.rubik(
                    color: Color(0xFF289CB4),
                    fontSize: 15,
                  ),
                ),
                onPressed: chooseImage,
              ),
            ),
            (_image.length == 0)
                ? Text(
                    "No image selected",
                    style: GoogleFonts.rubik(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                  )
                : Container(
                    height: 300,
                    width: 400,
                    padding: EdgeInsets.all(4),
                    child: GridView.builder(
                        itemCount: _image.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
        ));
  }

  Widget makeSubmit(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 40,
      ),
      child: TextButton(
          onPressed: () async {
            if (_form.currentState.validate()) {
              String uid = FirebaseAuth.instance.currentUser.uid;
              List<String> time_agenda = [];
              List<String> place_agenda = [];
              for (int i = 0; i < dropdown; i++) {
                time_agenda.add(agenda_time[i].text);
                place_agenda.add(agenda_place[i].text);
              }
              addTrip(
                place.text.trim(),
                city.text,
                country.text.trim(),
                description.text,
                uid,
                basename(thumnail.path),
                int.parse(cost.text),
                duration.text,
                4.8,
                this.selectedDate.hour,
                this.selectedDate,
                process(),
                queryTag,
                time_agenda,
                place_agenda,
              );
              addImage(thumnail);
              for (var i in _image) {
                addImage(i);
              }
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GuideMainScreen()));
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )),
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
