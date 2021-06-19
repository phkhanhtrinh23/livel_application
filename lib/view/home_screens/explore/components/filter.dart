import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopUpDialog extends StatefulWidget {
  PopUpDialog();

  @override
  _PopUpDialog createState() => _PopUpDialog();
}

class _PopUpDialog extends State<PopUpDialog> {
  _PopUpDialog();

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RowElements('Tag 1', 'Tag 2'),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 32,
                ),
              ),
              RowElements('Tag 3', 'Tag 4'),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 32,
                ),
              ),
              RowElements('Tag 5', 'Tag 6'),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 32,
                ),
              ),
              RowElements('Tag 7', 'Tag 8'),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 32,
                ),
              ),
              RowElements('Tag 9', 'Tag 10'),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
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
}

class RowElements extends StatefulWidget {
  RowElements(this.tag1, this.tag2);

  final String tag1;
  final String tag2;

  @override
  _RowElements createState() => _RowElements(tag1, tag2);
}

class _RowElements extends State<RowElements> {
  _RowElements(this.tag1, this.tag2);

  final String tag1;
  final String tag2;

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
                  bePressed[0] = !bePressed[0];
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
        Container(
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
                  bePressed[1] = !bePressed[1];
                },
              ),
            },
          ),
        ),
      ],
    );
  }
}
