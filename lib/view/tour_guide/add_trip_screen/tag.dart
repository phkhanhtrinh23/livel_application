import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livel_application/model/database/queryFunction.dart';

import 'add_trip.dart';

class Tag extends StatefulWidget {
  Tag();

  @override
  TagState createState() => TagState();
}

class TagState extends State<Tag> {
  TagState();
  static List<bool> selected = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTagList(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot>snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(AddTripState.queryTag != null)AddTripState.queryTag.clear();
          var tagList = (snapshot.data.get('TagList'));
          int tagLength = tagList.length;
          for(int i=0; i<tagLength;i++){
            selected.add(false);
          }
          return AlertDialog(
            title: Text(
              'Filter your trips',
              style: GoogleFonts.rubik(
                color: Color(0xFF289CB4),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            content: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                left: 32,
                right: 16,
              ),
              width: 300,
              child: ListView.builder(
                itemCount: (tagLength/2).ceil(),
                itemBuilder: (BuildContext context, int index){
                  return Column(
                    children: [
                      RowElements(
                          tagList[2*index],
                          (2*index+1<tagLength)?tagList[2*index+1]:null,
                          2*index,
                          (2*index+1<tagLength)?(2*index+1):(-1)
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom:32
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  for(int i=0;i<tagLength;i++){
                    if(selected[i]){
                      AddTripState.queryTag.add(tagList[i]);
                    }
                  }
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Color(0xFF289CB4),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}

class RowElements extends StatefulWidget {
  RowElements(this.tag1, this.tag2, this.index1, this.index2);

  final String tag1;
  final String tag2;
  final int index1;
  final int index2;

  @override
  _RowElements createState() => _RowElements(tag1, tag2, index1, index2);
}

class _RowElements extends State<RowElements> {
  _RowElements(this.tag1, this.tag2, this.index1, this.index2);

  final String tag1;
  final String tag2;
  final int index1,index2;
  List<bool> bePressed = [false, false];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: bePressed[0] ? Color(0xFF289CB4) : Colors.grey,
          ),
          child: TextButton(
            child: Text(
              '#' + tag1,
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => {
              setState(
                    () {
                  bePressed[0]=!bePressed[0];
                  TagState.selected[index1] = !TagState.selected[index1];
                },
              ),
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 32,
          ),
        ),
        tag2!=null?Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: bePressed[1] ? Color(0xFF289CB4) : Colors.grey,
          ),
          child: TextButton(
            child: Text(
              '#' + tag2,
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => {
              setState(
                    () {
                  bePressed[1]=!bePressed[1];
                  if(index2!=-1) TagState.selected[index2] = !TagState.selected[index2];
                },
              ),
            },
          ),
        ):Container()
      ],
    );
  }
}
