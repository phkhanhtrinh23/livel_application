import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livel_1/third_screen.dart';

class SecondScreen extends StatelessWidget {
  final _color1 = Color(0xFF687EF4);
  final _color2 = Color(0xFFF0FBFF);

  void _navigateNextRoute(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => ThirdScreen(),
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
              'images/bulb.png',
              scale: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Find something for you',
                style: GoogleFonts.nanumGothic(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Quarantine is a perfect time to try something new!',
                style: GoogleFonts.nanumGothic(
                  fontSize: 20,
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
