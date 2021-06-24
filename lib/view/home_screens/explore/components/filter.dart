import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livel_application/model/database/queryFunction.dart';

class PopUpDialog extends StatefulWidget {
  final Function callback;
  PopUpDialog(this.callback);

  @override
  _PopUpDialog createState() => _PopUpDialog();
}

class _PopUpDialog extends State<PopUpDialog> {
  _PopUpDialog();
  List<String> queryTag = [];

  @override
  void initState() {
    super.initState();
    queryTag = [];
    selected = [];
  }

  static List<bool> selected = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTagList(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var tagList = (snapshot.data.get('TagList'));
          int tagLength = tagList.length;
          for (int i = 0; i < tagLength; i++) {
            selected.add(false);
          }
          return AlertDialog(
            title: Text(
              'Favorite Types',
              style: GoogleFonts.rubik(
                color: Color(0xFF289CB4),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            content: Container(
              margin: const EdgeInsets.only(
                top: 16,
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              width: 500,
              child: ListView.builder(
                itemCount: (tagLength / 2).ceil(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      RowElements(
                          tagList[2 * index],
                          (2 * index + 1 < tagLength)
                              ? tagList[2 * index + 1]
                              : null,
                          2 * index,
                          (2 * index + 1 < tagLength) ? (2 * index + 1) : (-1)),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                      )
                    ],
                  );
                },
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 198,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Color(0xFF289CB4),
                    ),
                    child: TextButton(
                      onPressed: () {
                        for (int i = 0; i < tagLength; i++) {
                          if (selected[i]) {
                            queryTag.add(tagList[i]);
                            print(tagList[i]);
                          }
                        }
                        this.widget.callback(this.queryTag);
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
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
  final int index1, index2;
  List<bool> bePressed = [false, false];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: tag1.length < 11 ? tag1.length + 80.0 : tag1.length + 90.0,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: bePressed[0] ? Color(0xFF289CB4) : Colors.grey[400],
          ),
          child: TextButton(
            child: Text(
              '#' + tag1,
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            onPressed: () => {
              setState(
                () {
                  bePressed[0] = !bePressed[0];
                  _PopUpDialog.selected[index1] =
                      !_PopUpDialog.selected[index1];
                },
              ),
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 16,
          ),
        ),
        tag2 != null
            ? Container(
                width:
                    tag2.length < 11 ? tag2.length + 80.0 : tag2.length + 90.0,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: bePressed[1] ? Color(0xFF289CB4) : Colors.grey[400],
                ),
                child: TextButton(
                  child: Text(
                    '#' + tag2,
                    style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  onPressed: () => {
                    setState(
                      () {
                        bePressed[1] = !bePressed[1];
                        if (index2 != -1)
                          _PopUpDialog.selected[index2] =
                              !_PopUpDialog.selected[index2];
                      },
                    ),
                  },
                ),
              )
            : Container()
      ],
    );
  }
}
