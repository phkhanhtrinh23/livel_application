import 'package:flutter/material.dart';
import 'package:livel_application/splash_screens/page_view_screen.dart';

class FirstScreen extends StatelessWidget {
  final _color1 = Color(0xFF687EF4);
  final _color2 = Color(0xFFF0FBFF);

  void _navigateNextRoute(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => PageViewing(),
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
            Spacer(),
            Spacer(),
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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 120,
                color: Colors.white,
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
                    color: _color1,
                  ),
                ),
                color: _color2,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
