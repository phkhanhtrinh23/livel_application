import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livel_application/view/splash_screens/splash_screen_2.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Are you sure you want to quit?'),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                'Quit',
                style: TextStyle(
                  color: Color(0xFF289CB4),
                  fontWeight: FontWeight.normal,
                ),
              ),
              onPressed: () => SystemNavigator.pop(),
            ),
          ],
        ),
      ),
      child: Scaffold(
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
                  bottom: 160,
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(
                      'images/saly_15.png',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'New opportunities for\ntour guides',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 16,
                  left: 32,
                  right: 32,
                ),
                padding: const EdgeInsets.only(
                  bottom: 0,
                  top: 0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xFF289CB4),
                ),
                child: Container(
                  width: 335,
                  height: 68,
                  child: TextButton(
                    child: Text(
                      'NEXT',
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
                          builder: (context) => ThirdScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
