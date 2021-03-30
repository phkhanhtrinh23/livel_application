import 'package:flutter/material.dart';
import 'package:livel_application/splash_screens/splash_screen_3.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFDFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(
                  top: 100,
                  left: 20,
                  right: 20,
                  bottom: 182,
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(
                      'images/saly.png',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Provide interactive traveling experiences to any places with an ideal price.',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )),
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
                color: Color(0xFF4EAFC1),
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
                      builder: (context) => FourthScreen(),
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
