import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livel_application/splash_screens/page_view_screen.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreen createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  final _color1 = Color(0xFF5197E1);

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => PageViewing(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
              ),
            ),
            Text(
              'to',
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
              ),
            ),
            Text(
              'LIVEL',
              style: GoogleFonts.permanentMarker(
                color: Colors.white,
                fontSize: 100,
              ),
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
