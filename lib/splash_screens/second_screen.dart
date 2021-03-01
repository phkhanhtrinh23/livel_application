import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final _color2 = Color(0xFFF0FBFF);

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
                  Icons.lens_sharp,
                  size: 10,
                ),
                Icon(
                  Icons.lens_outlined,
                  size: 10,
                ),
              ],
            ),
            Spacer(),
            Spacer(),
            Image.asset(
              'images/bulb.png',
              scale: 1.6,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Find something for you',
                style: TextStyle(
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
                'Quarantine is a perfect time to try something new, from anywhere!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
