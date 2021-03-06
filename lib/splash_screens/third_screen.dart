import 'package:flutter/material.dart';
import 'package:livel_application/log_in_screens/HomeMain.dart';

class ThirdScreen extends StatelessWidget {
  final _color1 = Color(0xFF687EF4);
  final _color2 = Color(0xFFDBE1FF);

  void _navigateNextRoute(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomeMain(),
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
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lens_outlined,
                  size: 8,
                ),
                Icon(
                  Icons.lens_sharp,
                  size: 12,
                ),
              ],
            ),
            Spacer(),
            Spacer(),
            Image.asset(
              'images/bike_rider.png',
              scale: 3.5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'LET\'S TRAVEL',
                style: TextStyle(
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
                style: TextStyle(
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 100,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            SizedBox(
              width: 300,
              height: 50,
              child: FlatButton(
                onPressed: () => _navigateNextRoute(context),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 40,
                    color: _color2,
                  ),
                ),
                color: _color1,
              ),
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
