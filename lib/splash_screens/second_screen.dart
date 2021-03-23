import 'package:flutter/material.dart';
import 'package:livel_application/log_in_screens/HomeMain.dart';
import 'package:livel_application/log_in_screens/components/SignInPage.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF0FBFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/saly2.png',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'LET\'S TRAVEL\nwith LIVEL',
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
                'A whole new experience for home-based tourists',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 24,
                left: 32,
                right: 32,
              ),
              padding: const EdgeInsets.only(
                bottom: 0,
                top: 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xFF5197E1),
              ),
              child: FlatButton(
                minWidth: 335,
                height: 68,
                child: Text(
                  'LET\'S GO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
