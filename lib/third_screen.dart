import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livel_1/first_screen.dart';

class ThirdScreen extends StatelessWidget {
  final _color1 = Color(0xFF687EF4);
  final _color2 = Color(0xFFF0FBFF);

  void _navigateNextRoute(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FirstScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color2,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/bike_rider.png',
              scale: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'LET\'S TRAVEL',
                style: GoogleFonts.nanumGothic(
                  fontSize: 40,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'with',
                style: GoogleFonts.nanumGothic(
                  fontSize: 40,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'LIVEL',
                style: GoogleFonts.anton(
                  fontSize: 100,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateNextRoute(context),
        backgroundColor: _color1,
        tooltip: 'Next Page',
        child: Icon(
          Icons.arrow_right_alt,
          size: 40,
        ),
      ),
    );
  }
}
