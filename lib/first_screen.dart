import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livel_1/second_screen.dart';

class FirstScreen extends StatelessWidget {
  final _color1 = Color(0xFF687EF4);
  final _color2 = Color(0xFFF0FBFF);

  void _navigateNextRoute(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => SecondScreen(),
        ));
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
              style: GoogleFonts.nanumGothic(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
            Text(
              'to',
              style: GoogleFonts.nanumGothic(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
            Text(
              'LIVEL',
              style: GoogleFonts.anton(
                fontSize: 100,
                color: Colors.white,
              ),
            ),
            FlatButton(
              onPressed: () => _navigateNextRoute(context),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                'Get Started',
                style: GoogleFonts.rubik(
                  fontSize: 50,
                  color: _color1,
                ),
              ),
              color: _color2,
            ),
          ],
        ),
      ),
    );
  }
}
